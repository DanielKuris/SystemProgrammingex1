loops: basicClassification.c advancedClassificationLoop.c
	$ ar rc libclassloops.a basicClassification.o advancedClassificationLoop.o

recursives:	basicClassification.c advancedClassificationRecursion.c
	$ ar rc libclassrec.a basicClassification.o advancedClassificationRecursion.o

recursived: basicClassification.c advancedClassificationRecursion.c
	$ gcc - shared basicClassification.o advancedClassificationRecursion.o -o libclassrec.so

loopd: basicClassification.c advancedClassificationLoop.c
	$ gcc - shared basicClassification.o advancedClassificationLoop.o -o libclassloops.so

mains: main.c libclassrec.a
	$ gcc main.o  -lclassrec -L. -o mains

maindloop: main.c libclassloops.so
	$ gcc main.c -L. -lclassloops -o maindloop

maindrec:  main.c libclassloops.so
	$ gcc main.c -L. -lclassrec -o maindrec

