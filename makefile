main.o: main.c
	$ gcc -Wall -c main.c

basicClassification.o: basicClassification.c NumClass.h
	$ gcc -Wall -c basicClassification.c

libclassloops.a: basicClassification.c advancedClassificationLoop.c NumClass.h
	$ gcc -Wall -c basicClassification.c advancedClassificationLoop.c
	$ ar rcs libclassloops.a basicClassification.o advancedClassificationLoop.o

libclassrec.a: basicClassification.c advancedClassificationRecursion.c NumClass.h
	$ gcc -Wall -c basicClassification.c advancedClassificationRecursion.c
	$ ar rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

libclassloops.so: basicClassification.c advancedClassificationLoop.c NumClass.h
	$ gcc -Wall -c -Werror -fpic basicClassification.c advancedClassificationLoop.c
	$ gcc -shared -Wall  basicClassification.o advancedClassificationLoop.o -o libclassloops.so

libclassrec.so: basicClassification.o advancedClassificationRecursion.o NumClass.h
	$ gcc -Wall -c -Werror -fpic basicClassification.c advancedClassificationRecursion.c
	$ gcc -shared -Wall  basicClassification.o advancedClassificationRecursion.o -o libclassrec.so

loops: libclassloops.a

recursives:	libclassrec.a

recursived: libclassrec.so

loopd: libclassloops.so

mains: main.o libclassrec.a
	$ gcc -Wall main.o libclassrec.a -o mains

maindloop: main.o libclassloops.so
	$ gcc -Wall main.o ./libclassloops.so -o maindloop

maindrec:  main.o libclassrec.so
	$ gcc -Wall main.o ./libclassrec.so -o maindrec

all: loops recursives mains maindloop maindrec 

clean: 
	rm *.so *.a *.o mains maindloop maindrec
