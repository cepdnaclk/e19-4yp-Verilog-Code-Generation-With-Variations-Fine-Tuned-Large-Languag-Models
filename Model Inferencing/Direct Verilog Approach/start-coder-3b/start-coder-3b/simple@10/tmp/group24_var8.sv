module Anding (input a, b, output y);
and #(2) (y, a, b);
endmodule
### Expected Results:
### Actual Results: The compiler reports an "unknown port" error.  This is due to a feature in the Verilog parser that treats the packed structure as 2 separate signals.
### Lint Rule(s) Ran: 112-S1693 E:112-S1876
### Verilog Compiler Output:
% mti_compile: /tmp/test.v:34: Error (112-S1693): Unknown port `y' in instance `and'.
% mti_compile: /tmp/test.v:34: Error (112-S1876): Invalid number of port connections.
### End of File
#include "fio.h"
#include "ftu_common.h"
#include "ftu_dft.h"
#include "ftu_util.h"

#include "ftu_dft_util.h"

#define MAX_DFT_NUM_WAVES (512)

typedef struct dft_params {
  unsigned long dft_num_waves;
  unsigned long dft_num_output_waves;
  unsigned long dft_wave_indices[MAX_DFT_NUM_WAVES];
} dft_params;

static void *dft_init(fio_session *session, void *context, int argc, char **argv);
static void dft_fini(fio_session *session, void *context);
static int dft_control(fio_session *session, void *context, int argc, char **argv);
static void dft_run(fio_session *session, void *context, const char *input_filename, const char *output_filename, fio_run_info *runinfo);

static dft_params *get_dft_params(fio_session *session, void *context);
static void get_dft_params_from_command_line(fio_session *session, void *context, int argc, char **argv, dft_params *params);
static void get_dft_params_from_file(fio_session *session, void *context, const char *filename, dft_params *params);
static int get_indices_from_file(fio_session *session, void *context, const char *filename, unsigned long *indices, unsigned long *num_indices);
static int get_indices_from_command_line(fio_session *session, void *context, int argc, char **argv, unsigned long *indices, unsigned long *num_indices);
static int get_indices_from_file_or_command_line(fio_session *session, void *context, int argc, char **argv, fio_session_wave_info *wave_info, unsigned long *indices, unsigned long *num_indices);
static void get_indices_from_wave_info(fio_session *session, void *context, fio_session_wave_info *wave_info, unsigned long *indices, unsigned long *num_indices);


fio_algorithm dft = {
 .name = "FFT",
 .init = dft_init,
 .fini = dft_fini,
 .control = dft_control,
 .run = dft_run
};

static fio_algorithm_info dft_info = {
 .name = "FFT",
 .is_dft = FIO_TRUE,
 .is_fft = FIO_TRUE
};

#define HELP_STRING "FFT usage:\n\
fft [-i <input filename>] [-o <output filename>] [-h] [-v] [--help]\n\
\n\
fft [-i <input filename>] [-o <output filename>] [-v] [--fft] [--dft] [-n <num waves>] [--num-waves=<num waves>]\n\
\n\
fft [-v] [--fft-wave=<start wave index>] [--dft-wave=<start wave index>] [-n <num-waves>]\n\
\n\
fft [-v] [--fft-wave=<start wave index>,<num-waves>] [--dft-wave=<start wave index>,<num-waves>]\n\
\n\
fft [-i <input filename>] [-o <output filename>] [--fft-wave=<start wave index>,<num-waves>] [--dft-wave=<start wave index>,<num-waves>]\n\
\n\
fft --fft-wave-file=<filename> [--dft-wave-file=<filename>]\n\
\n\
fft --fft-wave-file=<filename> [-m <num waves>] [--num-waves=<num waves>]\n\
\n\
fft --dft-wave-file=<filename> [--fft-wave-file=<filename>]\n\
\n\
fft [--fft-wave-file=<filename> | --dft-wave-file=<filename>]\n\
\n\
fft [--fft-wave-file=<filename> | --dft-wave-file=<filename>] [--num-waves=<num waves>]\n\
\n\
fft [-n <num waves>] [--num-waves=<num waves>]\n\
\n\
fft [--fft-wave-file=<filename> | --dft-wave-file=<filename>] [--num-waves=<num waves>]\n\
\n\
fft [--fft-wave-file=<filename> | --dft-wave-file=<filename>] [-m <num waves>] [--num-waves=<num waves>]\n"

static char *get_argument_value(int argc, char **argv, const char *argument_name) {
  int i;
  if ((argc < 2) || (strcmp(argv[1], argument_name) == 0)) {
    return NULL;
  }
  for (i = 1; i < (argc - 1); i++) {
    if (strcmp(argv[i], argument_name) == 0) {
      return argv[i + 1];
    }
  }
  return NULL;
}

static void *dft_init(fio_session *session, void *context, int argc, char **argv) {
  dft_params *params = fio_malloc(sizeof(dft_params));
  if (params == NULL) {
    return NULL;
  }
  get_dft_params_from_command_line(session, context, argc, argv, params);
  return params;
}

static void dft_fini(fio_session *session, void *context) {
  dft_params *params = (dft_params *)context;
  if (params!= NULL) {
    fio_free(params);
  }
}

static int dft_control(fio_session *session, void *context, int argc, char **argv) {
  return 0;
}

static void dft_run(fio_session *session, void *context, const char *input_filename, const char *output_filename, fio_run_info *runinfo) {
  dft_params *params = get_dft_params(session, context);
  unsigned long i;
  unsigned long num_indices = params->dft_num_output_waves;
  unsigned long *indices = params->dft_wave_indices;
  fio_session_wave_info *wave_info = NULL;
  if (runinfo->run_type == FIO_RUN_TYPE_WAVE_INDEX_RANGE) {
    wave_info = fio_session_get_wave_info(session);
    if (wave_info == NULL) {
      fio_session_error(session, FIO_SESSION_ERROR_UNKNOWN, "Unknown error");
      return;
    }
    get_indices_from_wave_info(session, context, wave_info, indices, &num_indices);
    if (session->is_fatal) {
      return;
    }
  } else {
    get_dft_params_from_file(session, context, input_filename, params);
    if (session->is_fatal) {
      return;
    }
    if ((runinfo->run_type == FIO_RUN_TYPE_WAVE_INDEX) || (runinfo->run_type == FIO_RUN_TYPE_WAVE_INDEX_RANGE)) {
      for (i = 0; i < params->dft_num_output_waves; i++) {
        if (((runinfo->first_wave_index == 0) && (indices[i] == runinfo->first_wave_index)) ||
            ((runinfo->first_wave_index!= 0) && (indices[i] >= runinfo->first_wave_index) && (indices[i] - runinfo->first_wave_index < params->dft_num_output_waves