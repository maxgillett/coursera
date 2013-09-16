import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.Ignore;
import java.util.Iterator;

public class DequeTest {

  private Deque<Integer> dq = new Deque<Integer>();
  public static final int size = 5;

  @Test
  public void newDequeIsEmpty() {
    assertTrue("New deque is not empty", dq.isEmpty());
  }

  @Test
  public void addFirstToEmptyDequeIncreasesSizeByOne() {
    dq.addFirst(1);
    assertEquals("Deque does not increase by 1", 1, dq.size());
  }

  @Test
  public void addLastToEmptyDequeIncreasesSizeByOne() {
    dq.addLast(1);
    assertEquals("Deque does not increase by 1", 1, dq.size());
  }

  @Test
  public void addFirstManyTimesIncreasesSize() {
    for (int i=0; i<size; i++) {
      dq.addFirst(i);
    }
    assertEquals("Deque does not increase", size, dq.size());
  }

  @Test
  public void addLastManyTimesIncreasesSize() {
    for (int i=0; i<size; i++) {
      dq.addLast(i);
    }
    assertEquals("Deque does not increase", size, dq.size());
  }

  @Test
  public void addAndRemoveToEmptyDequeChangesNothing() {
    dq.addFirst(1);
    dq.removeFirst();
    assertTrue("Deque is not empty", dq.isEmpty());
    dq.addFirst(1);
    dq.removeLast();
    assertTrue("Deque is not empty", dq.isEmpty());
    dq.addLast(1);
    dq.removeFirst();
    assertTrue("Deque is not empty", dq.isEmpty());
    dq.addLast(1);
    dq.removeLast();
    assertTrue("Deque is not empty", dq.isEmpty());
  }

  @Test
  // There has to be a better way to organize something like this in JUnit
  // Parameterized testing? Can that be done in a nested class?
  public void itemsReturnInCorrectOrderAddingFirstRL() {
    //int[] resultRF= new int[size];
    int[] resultRL = new int[size];
    //int[] expectedRF = new int[size];
    int[] expectedRL = new int[size];
    for (int i=0; i<size; i++) {
      dq.addFirst(i);
      expectedRL[i] = i;
      //expectedRF[size-1-i] = i;
    }
    for (int i=0; i<size; i++) {
      resultRL[i] = dq.removeLast();
      //resultRF[i] = dq.removeFirst();
    }
    assertArrayEquals(expectedRL, resultRL);
    //assertArrayEquals(expectedRF, resultRF);
  }

  @Test
  public void itemsReturnInCorrectOrderAddingFirstRF() {
    int[] resultRF= new int[size];
    //int[] resultRL = new int[size];
    int[] expectedRF = new int[size];
    //int[] expectedRL = new int[size];
    for (int i=0; i<size; i++) {
      dq.addFirst(i);
      expectedRF[i] = i;
      //expectedRL[size-1-i] = i;
    }
    for (int i=0; i<size; i++) {
      resultRF[i] = dq.removeLast();
      //resultRL[i] = dq.removeFirst();
    }
    //assertArrayEquals(expectedRL, resultRL);
    assertArrayEquals(expectedRF, resultRF);
  }

  @Test
  public void iteratorCyclesThroughAddFirstConstructedStack() {
    int[] result = new int[size];
    int[] expected = new int[size];
    for (int i=0; i<size; i++) {
      dq.addFirst(i);
      expected[size-1-i] = i;
    }
    compareIteratorResult(expected, result);
  }

  @Test
  public void iteratorCyclesThroughAddLastConstructedStack() {
    int[] result = new int[size];
    int[] expected = new int[size];
    for (int i=0; i<size; i++) {
      dq.addLast(i);
      expected[i] = i;
    }
    compareIteratorResult(expected, result);
  }

  @Test
  public void iteratorCyclesThroughMixedAddConstructedStack() {
    int[] result = new int[size];
    int[] expected = {3, 1, 0, 2, 4};
    for (int i=0; i<size; i++) {
      if (i % 2 == 0) dq.addLast(i);
      if (i % 2 != 0) dq.addFirst(i);
    }
    compareIteratorResult(expected, result);
  }

  private void compareIteratorResult(int[] expected, int[] result) {
    Iterator<Integer> iter = dq.iterator();
    int i = 0;
    while (iter.hasNext()) {
      result[i] = iter.next();
      i++;
    }
    assertArrayEquals(expected, result);
  }

  @Test(expected = java.lang.UnsupportedOperationException.class)
  public void removeInIteratorThrowsError() {
    for (int i=0; i<size; i++) {
      dq.addLast(i);
    }
    Iterator<Integer> iter = dq.iterator();
    iter.remove();
  }

  @Test(expected = java.lang.UnsupportedOperationException.class)
  public void nextInExhaustedIteratorThrowsError() {
    for (int i=0; i<size; i++) {
      dq.addLast(i);
    }
    Iterator<Integer> iter = dq.iterator();
    for (int i=0; i<size+1; i++) {
      iter.next();
    }
  }

  @Test(expected = java.util.NoSuchElementException.class)
  public void removeFirstFromEmptyDequeThrowsError() {
    dq.removeFirst();
  }

  @Test(expected = java.util.NoSuchElementException.class)
  public void removeLastFromEmptyDequeThrowsError() {
    dq.removeLast();
  }

  @Test(expected = NullPointerException.class)
  public void addFirstNullThrowsError() {
    dq.addFirst(null);
  }

  // Why does this test not work?
  @Test(expected = NullPointerException.class)
  public void addLastNullThrowsError() {
    dq.addLast(null);
  }

}
