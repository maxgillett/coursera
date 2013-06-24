/*
 * CSE 351 HW1 (Data Lab - Pointers)
 *
 * <Please put your name and userid here>
 *
 * pointer.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, the following function declaration should prevent a
 * compiler warning. In general, it's not good practice to ignore
 * compiler warnings, but in this case it's OK.
 */
int printf(const char *, ...);

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to this homework by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code
  must conform to the following style:

  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. For 1-4, only Unary integer operations *, & and Binary integer
      operations - + * are allowed. For the last three, you may also
      use shifts (<<, >>), ~, ==, and ^.

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, ?: or sizeof.
  6. Use any data type other than those already in the declarations provided.

  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

/*
 * STEP 2: Modify the following functions according the coding rules.
 *
 * Test the code below in your own 'main' program.
 *
 */

#endif

/*
 * Return the size of an integer in bytes.
 */
int intSize() {
  int intArray[10];
  int * intPtr1;
  int * intPtr2;
  intPtr1 = &intArray[0];
  intPtr2 = &intArray[0] + 1;
  return ((long int) intPtr2 - (long int) intPtr1); 
  // ints are 32 bits on this architecture and pointers are 64, 
  // so compiler throws a warning when trying to cast to a smaller 
  // precision, thus a long int is used here
}

/*
 * Return the size of a double in bytes.
 */
int doubleSize() {
  double doubArray[10];
  double * doubPtr1;
  double * doubPtr2;
  doubPtr1 = doubArray;
  doubPtr2 = doubArray + 1;
  return ((long int) doubPtr2 - (long int) doubPtr1);
}

/*
 * Return the size of a pointer in bytes.
 */
int pointerSize() {
  double * ptrArray[10];
  double ** ptrPtr1;
  double ** ptrPtr2;
  ptrPtr1 = ptrArray;
  ptrPtr2 = ptrArray + 1;
  return ((long int) ptrPtr2 - (long int) ptrPtr1);
}

/*
 * Modify intArray[5] to be the value 351 using only &intArray and
 * pointer arithmetic.
 */
int changeValue() {
  int intArray[10];
  int * intPtr1 = intArray;
  int * intPtr2;
  intPtr2 = intPtr1 + 5;
  *intPtr2 = 351;
  return intArray[5];
}


/*
 * Return 1 if ptr1 and ptr2 are within the *same* 64-byte aligned
 * block (or word) of memory. Return zero otherwise.
 *
 * Operators / and % and loops are NOT allowed.
 */
int withinSameBlock(int * ptr1, int * ptr2) {
  long int a = (long int) ptr1;
  long int b = (long int) ptr2;
  return !((~(b >> 6) + 1) + (a >> 6));
}

/*
 * Return 1 if ptr points to an element within the specified intArray,
 * 0 otherwise.
 */
int withinArray(int * intArray, int size, int * ptr) {
  long int a = (long int) intArray;
  long int b = (long int) &intArray[size - 1];
  long int c = (long int) ptr;
  long int d = (~(c - a) >> 63) & 1;
  long int e = (~(b - c) >> 63) & 1;
  long int f = ((a & 3) == (c & 3));
  return (d & e & f);
  // Var f is a check to see if the memory address pointed to by ptr
  // points to the beginning of an int. This isn't tested by ptest.c
}
/*
 * Return x with the n bits that begin at position p inverted (i.e.,
 * turn 0 into 1 and vice versa) and the rest left unchanged. Consider
 * the indices of x to begin with the low-order bit numbered as 0.
 */
int invert(int x, int p, int n) {
  return (~(~0 << n) << p) ^ x;
}
