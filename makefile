CC=gcc
AR=ar

all: mains maindloop maindrec libclassloops.a

loops: libclassloops.a

recursives: libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so
	
clean:
	rm -f *.o *.a *.so maindrec maindloop mains

basicClassification.o: basicClassification.c NumClass.h 
	$(CC) -c basicClassification.c

libclassloops.a: advancedClassificationLoop.c NumClass.h
	$(CC) -Wall -c advancedClassificationLoop.c
	$(AR) -rcs libclassloops.a advancedClassificationLoop.o

libclassrec.a: advancedClassificationRecursion.c NumClass.h
	$(CC) -Wall -c advancedClassificationRecursion.c
	$(AR) -rcs libclassrec.a advancedClassificationRecursion.o
	
libclassloops.so: advancedClassificationLoop.c NumClass.h
	$(CC) -Wall -c -Werror -fpic advancedClassificationLoop.c
	$(CC) -shared -Wall advancedClassificationLoop.o -o libclassloops.so
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/library
libclassrec.so: advancedClassificationRecursion.c NumClass.h
	$(CC) -Wall -c -Werror -fpic advancedClassificationRecursion.c
	$(CC) -shared -Wall advancedClassificationRecursion.o -o libclassrec.so
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/path/to/library

mains: main.c basicClassification.o libclassrec.a
	$(CC) -Wall -o mains main.c basicClassification.o libclassrec.a

maindloop: main.c basicClassification.o libclassloops.so
	$(CC) -Wall -o maindloop main.c basicClassification.o ./libclassloops.so

maindrec: main.c basicClassification.o libclassrec.so
	$(CC) -Wall -o maindrec main.c basicClassification.o ./libclassrec.so

