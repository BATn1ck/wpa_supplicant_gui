LIBS_FLAGS = $(shell pkg-config --cflags --libs gtk+-3.0) -lpthread
WPA_PATH = wpa_supplicant/
IW_PATH = iw/
CC = gcc
CC_FLAGS = -Wall -rdynamic

compile_iw:
	$(CC) -c $(IW_PATH)interfaces.c -o interfaces.o $(LIBS_FLAGS) $(CC_FLAGS)
	$(CC) -c $(IW_PATH)iw_combobox.c -o iw_combobox.o $(LIBS_FLAGS) $(CC_FLAGS)
	$(CC) -c $(IW_PATH)iw_mac_label.c -o iw_mac_label.o $(LIBS_FLAGS) $(CC_FLAGS)
	$(CC) -c $(IW_PATH)iw_mac_button.c -o iw_mac_button.o $(LIBS_FLAGS) $(CC_FLAGS)

compile_wpa:
	$(CC) -c $(WPA_PATH)files_job.c -o files_job.o $(LIBS_FLAGS) $(CC_FLAGS)
	$(CC) -c $(WPA_PATH)text_log.c -o text_log.o $(LIBS_FLAGS) $(CC_FLAGS)
	$(CC) -c $(WPA_PATH)wpa_subprocess.c -o wpa_subprocess.o $(LIBS_FLAGS) $(CC_FLAGS)

compile: compile_iw compile_wpa
	$(CC) *.o main.c -o main $(LIBS_FLAGS) $(CC_FLAGS)

run:
	./main

default: compile_iw compile_wpa compile

build: default run

clean:
	rm -f *.o
