### Slicing Code:
`ifdef TEST_SLICE_ARRAY
  integer i;
  initial begin
    for (i=0; i<4; i++) begin
      $display("in[%d] = %b, con[%d] = %b, out[%d] = %b",i,in[i],i,con[i],i,out[i]);
    end
  end
`
### Slicing Test Result:
##### in[0] = 0, con[0] = 1, out[0] = 1
##### in[1] = 1, con[1] = 1, out[1] = 0
##### in[2] = 1, con[2] = 0, out[2] = 1
##### in[3] = 0, con[3] = 1, out[3] = 1
#include <stdio.h>
#include <stdlib.h>

int main() {
  int i;
  char **array;
  array = (char**) malloc(3*sizeof(char*));
  for (i=0; i<3; ++i) {
    array[i] = (char*) malloc(10*sizeof(char));
    sprintf(array[i], "Value[%d]", i);
  }

  for (i=0; i<3; ++i) {
    printf("%s\n", array[i]);
    free(array[i]);
  }
  free(array);
  return 0;
}

#include <stdio.h>
#include <stdlib.h>

int main(){
  int i;
  char **array;
  array = (char**)malloc(3*sizeof(char*));
  for (i=0; i<3; ++i) {
    array[i] = (char*)malloc(10*sizeof(char));
    sprintf(array[i], "Value[%d]", i);
  }

  for (i=0; i<3; ++i) {
    printf("%s\n", array[i]);
    free(array[i]);
  }

  for (i=0; i<3; ++i) {
    printf("%p\n", array[i]);
  }

  free(array);

  return 0;
}
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

typedef struct node {
  int val;
  struct node *next;
} node;

void init_node(node *n, int v) {
  n->val = v;
  n->next = NULL;
}

void push_node(node **head, int v) {
  node *new_node;
  new_node = malloc(sizeof(node));
  new_node->val = v;
  new_node->next = *head;
  *head = new_node;
}

node* pop_node(node **head) {
  node *new_node = *head;
  *head = (*head)->next;

  return new_node;
}

int main(int argc, char **argv) {
  if (argc!= 4) {
    fprintf(stderr, "Usage: %s <size1> <size2> <size3>\n", argv[0]);
    return EXIT_FAILURE;
  }

  int size1 = atoi(argv[1]);
  int size2 = atoi(argv[2]);
  int size3 = atoi(argv[3]);

  int i;
  node *head1, *head2, *head3;
  head1 = head2 = head3 = NULL;
  for (i = 0; i < size1; i++) {
    init_node(&head1, i);
  }

  for (i = 0; i < size2; i++) {
    init_node(&head2, i);
  }

  for (i = 0; i < size3; i++) {
    init_node(&head3, i);
  }

  node *last1 = head1;
  node *last2 = head2;
  node *last3 = head3;

  for (i = 0; i < (size1-1)/2 + 1; i++) {
    last1 = last1->next;
  }

  for (i = 0; i < (size2-1)/2 + 1; i++) {
    last2 = last2->next;
  }

  for (i = 0; i < (size3-1)/2 + 1; i++) {
    last3 = last3->next;
  }

  last1->next = head2;
  last2->next = head3;
  last3->next = head1;

  assert(head1->next->val == head2->val);
  assert(head2->next->val == head3->val);
  assert(head3->next->val == head1->val);

  for (i = 0; i < size1; i++) {
    printf("%d\n", pop_node(&head1)->val);
  }

  for (i = 0; i < size2; i++) {
    printf("%d\n", pop_node(&head2)->val);
  }

  for (i = 0; i < size3; i++) {
    printf("%d\n", pop_node(&head3)->val);
  }

  return EXIT_SUCCESS;
}

def get_file_list(rootdir):
  import os
  import re
  allFiles = []
  for dirpath, dirnames, filenames in os.walk(rootdir):
    for filename in [f for f in filenames if re.search("v", f, flags=re.IGNORECASE)]:
      allFiles.append(os.path.join(dirpath, filename))
  return allFiles

def check_file(filepath):
  import os
  import re
  import subprocess

  try:
    f = open(filepath, "r")
    lines = f.readlines()
    f.close()
  except IOError:
    print(filepath + " doesn't exist.")
  else:
    for line in lines:
      pattern = r'^\s*module\s*'
      if re.match(pattern, line):
        sub_code = []
        sub_code.append(line)
        line = line.strip()
        #print(line)
        #print(re.match(pattern, line))
        pattern = r'\bmodule\s+(\w+)\s*\('
        module_name = re.findall(pattern, line)[0]
        #print(module_name)
        #print(re.findall(pattern, line))
        sub_code.append(f'    /* module {module_name} */\n')
        pattern = r'\bmodule\s+\w+\s*\(\s*'
        end_pattern = r'\bendmodule'
        file_code = []
        file_code.append(f'/* {filepath} */\n')
        #print("In module " + module_name)
        while True:
          line = f.readline()
          #print(line)
          #print(re.match(pattern, line))
          pattern = r'{0}\s*\('
          if re.match(pattern, line):
            sub_code.append(line)
            line = line.strip()
            #print(line)
            sub_name = re.findall(pattern, line)[0]
            #print(sub_name)
            sub_code.append(f'    /* {sub_name} */\n')
          sub_code.append(line)
          #print(line)
          if re.search(end_pattern, line):
            break
        file_code.append(line)
        for sub_line in sub_code:
          file_code.append(sub_line)
          #print(sub_line)
        file_code.append(line)
        tmp_code = " ".join(file_code)
        #print(tmp_code)
        #print(re.search('endmodule', tmp_code))
        #print(re.findall('module\s+(\w+)', tmp_code))
        #print(re.findall('module\s+\w+\s+\(', tmp_code))
        if (re.search('endmodule', tmp_code) and re.findall('module\s+(\w+)', tmp_code)):
          file_code.append('\n')
          #print(re.findall('module\s+\w+\s*\(\s*', tmp_code))
          tmp_name = re.findall('module\s+(\w+)\s*', tmp_code)[0]
          file_code.append(f'    /* {tmp_name} end */\n')
          file_code.append('\n')
          file_code.append(f'    /* module {tmp_name} */\n')
          file_code.append(f'    /* {tmp_name} end */\n')
          file_code.append('\n')
          file_code.append(f'    /* module {tmp_name} */\n')
        #print(file_code)
        out_file_name = f'./inst/files/{os.path