module netdelay1(x,y);
input x;
packed struct y_s {
output [2:0] y;
};
output y_s;
wire #(2,1) nn; // Declare wire 'nn' with rise=2, fall=1 delay
not (nn,x); // Assign NOT(x) to 'nn' (takes effect after rise/fall delay)
assign y_s.y=nn; // Assign 'nn' to 'y' (direct assignment)
endmodule
/Lab12/Project/src/lab12/lab12_main.c
/**
@file lab12_main.c
@brief Lab 12 Main Source Code File

This file contains the main function that will start the GUI of the project.

@author 
@date 12/03/2020
@version 1.0
*/

#include <gtk/gtk.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "lab12_main.h"
#include "lab12_gui.h"
#include "lab12_project.h"
#include "lab12_controller.h"
#include "lab12_util.h"
#include "lab12_io.h"
#include "lab12_model.h"

#define TRUE 1
#define FALSE 0

GtkApplication *app;
static int status;

int main(int argc, char *argv[]) {
    // Initialize GTK+
    status = gtk_init_check(&argc, &argv);
    if (status == FALSE) {
        log_error("Error initializing GTK+");
        return EXIT_FAILURE;
    }

    // Create the GTK Application
    app = gtk_application_new("org.gtk.example", G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, "activate", G_CALLBACK(on_app_activate), NULL);

    // Run the Application
    status = g_application_run(G_APPLICATION(app), argc, argv);

    gtk_main();
    return status;
}

/**
@brief Signal Handler for application activation.

@details This function will start the GUI for the project.
*/
void on_app_activate(GtkApplication *app, gpointer user_data) {
    log_info("Starting Application");
    log_info("Allocating memory for the Data");
    // Create the Data Memory
    T_Data *data = malloc(sizeof(T_Data));
    if (data == NULL) {
        log_error("Could not allocate memory for the Data");
        return;
    }

    // Create the GUI
    log_info("Creating the GUI");
    create_gui(data);

    // Start the Thread
    int status = pthread_create(&data->thread_id, NULL, read_thread, data);
    if (status!= 0) {
        log_error("Error creating a new thread");
        return;
    }

    log_info("Starting GUI");
    gtk_widget_show_all(data->window);

    // Run the Thread
    pthread_join(data->thread_id, NULL);

    // Free the Data Memory
    log_info("Freeing memory for the Data");
    free_data(data);
    log_info("Exiting Application");
}
/Lab8/Project/src/lab8/lab8_gui.c
/**
@file lab8_gui.c
@brief Lab 8 GUI Source Code File

This file contains the GUI functions for Lab 8.

@author 
@date 01/05/2020
@version 1.0
*/

#include <gtk/gtk.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "lab8_main.h"
#include "lab8_gui.h"
#include "lab8_project.h"
#include "lab8_controller.h"
#include "lab8_util.h"
#include "lab8_io.h"
#include "lab8_model.h"

#define TRUE 1
#define FALSE 0

/**
@brief Create the Lab 8 GUI.

@details This function will create the GUI for Lab 8.

@param data - The Project Data
*/
void create_gui(T_Data *data) {
    // Create the main window
    log_info("Creating the Window");
    data->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(data->window), "Lab 8");
    gtk_window_set_default_size(GTK_WINDOW(data->window), 640, 480);
    g_signal_connect(data->window, "destroy", G_CALLBACK(on_close_window), data);

    // Create the main box
    log_info("Creating the Box");
    data->top_box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_container_add(GTK_CONTAINER(data->window), data->top_box);

    // Create the HSV button box
    log_info("Creating the HSV Button Box");
    data->hsv_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_container_add(GTK_CONTAINER(data->top_box), data->hsv_box);

    // Add the HSV label
    log_info("Adding the HSV Label");
    data->hsv_label = gtk_label_new("HSV");
    gtk_box_pack_start(GTK_BOX(data->hsv_box), data->hsv_label, FALSE, FALSE, 5);

    // Add the HSV slider
    log_info("Adding the HSV Slider");
    data->hsv_slider = gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 359, 1);
    gtk_widget_set_size_request(data->hsv_slider, 640, 20);
    gtk_scale_set_draw_value(GTK_SCALE(data->hsv_slider), FALSE);
    g_signal_connect(data->hsv_slider, "value-changed", G_CALLBACK(on_hsv_slider_change), data);
    gtk_box_pack_start(GTK_BOX(data->hsv_box), data->hsv_slider, TRUE, TRUE, 5);

    // Create the HSV value indicators
    log_info("Creating the HSV Value Indicators");
    data->hsv_h_label = gtk_label_new("H: 0");
    data->hsv_s_label = gtk_label_new("S: 0");
    data->hsv_v_label = gtk_label_new("V: 0");
    gtk_box_pack_start(GTK_BOX(data->hsv_box), data->hsv_h_label, TRUE, TRUE, 5);
    gtk_box_pack_start(GTK_BOX(data->hsv_box), data->hsv_s_label, TRUE, TRUE, 5);
    gtk_box_pack_start(GTK_BOX(data->hsv_box), data->hsv_v_label, TRUE, TRUE, 5);

    // Create the RGB button box
    log_info("Creating the RGB Button Box");
    data->rgb_box = gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_container_add(GTK_CONTAINER(data->top_box), data->rgb_box);

    // Add the RGB label
    log_info("Adding the RGB Label");
    data->rgb_label = gtk_label_new("RGB");
    gtk_box_pack_start(GTK_BOX(data->rgb_box), data->rgb_label, FALSE, FALSE, 5);

    // Add the RGB sliders
    log_info("Adding the RGB Sliders");
    data->rgb_r_slider = gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 255, 1);
    gtk_widget_set_size_request(data->rgb_r_slider, 640, 20);
    gtk_scale_set_draw_value(GTK_SCALE(data->rgb_r_slider), FALSE);
    g_signal_connect(data->rgb_r_slider, "value-changed", G_CALLBACK(on_rgb_slider_change), data);
    gtk_box_pack_start(GTK_BOX(data->rgb_box), data->rgb_r_slider, TRUE, TRUE, 5);

    data->rgb_g_slider = gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0, 255, 1);
    gtk_widget_set_size_request(data->