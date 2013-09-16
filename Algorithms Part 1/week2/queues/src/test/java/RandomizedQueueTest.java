import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.Ignore;
import java.util.Iterator;

public class RandomizedQueueTest {

  private RandomizedQueue<Integer> rq = new RandomizedQueue<Integer>();
  public static final int size = 5;

  @Test
  public void newRandomizedQueueIsEmpty() {
    assertTrue("New RQ is not empty", rq.isEmpty());
  }

  @Test
  public void enqueueToEmptyRQIncreasesSizeByOne() {
    rq.enqueue(1);
    assertEquals("RQ does not increase by 1", 1, rq.size());
  }

  @Test
  public void enqueueManyTimesIncreasesSize() {
    for (int i=0; i<size; i++) {
      rq.enqueue(i);
    }
    assertEquals("RQ does not increase", size, rq.size());
  }

  @Test
  public void addAndRemoveToEmptyRQChangesNothing() {
    rq.enqueue(1);
    rq.dequeue();
    assertTrue("RQ is not empty", rq.isEmpty());
  }

  @Test
  public void enqeueueAndSampleDoesNotRemoveItem() {
    rq.enqueue(1);
    int i = rq.sample();
    assertEquals("Sampled response is not 1", 1, i);
  }

/*
  @Test
  public void iteratorCyclesThroughRQ() {
    int[] result = new int[size];
    int[] expected = new int[size];
    for (int i=0; i<size; i++) {
      dq.addFirst(i);
      expected[size-1-i] = i;
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

*/

  // TODO: Resizing tests


  @Test(expected = java.lang.UnsupportedOperationException.class)
  public void removeInIteratorThrowsError() {
    for (int i=0; i<size; i++) {
      rq.enqueue(i);
    }
    Iterator<Integer> iter = rq.iterator();
    iter.remove();
  }

  @Test(expected = java.lang.UnsupportedOperationException.class)
  public void nextInExhaustedIteratorThrowsError() {
    for (int i=0; i<size; i++) {
      rq.enqueue(i);
    }
    Iterator<Integer> iter = rq.iterator();
    for (int i=0; i<size+1; i++) {
      iter.next();
    }
  }

  @Test(expected = java.util.NoSuchElementException.class)
  public void sampleFromEmptyRQThrowsError() {
    rq.sample();
  }

  @Test(expected = java.util.NoSuchElementException.class)
  public void dequeueFromEmptyRQThrowsError() {
    rq.dequeue();
  }

  @Test(expected = NullPointerException.class)
  public void enqueuNullThrowsError() {
    rq.enqueue(null);
  }

}
