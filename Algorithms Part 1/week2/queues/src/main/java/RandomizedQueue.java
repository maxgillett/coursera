import java.util.Iterator;

public class RandomizedQueue<Item> implements Iterable<Item> {
  private int N;
  private Item[] a;
 
  // construct an empty randomized queue
  public RandomizedQueue() {
    N = 0;
    a = (Item[]) new Object[2];
  }

  // is the queue empty?
  public boolean isEmpty() {
    return N == 0;
  }

  // return the number of items on the queue
  public int size() {
    return N;
  }

  // add the item
  public void enqueue(Item item) {
    if (item == null) throw new java.lang.NullPointerException();
    if (N == a.length) resize(2*a.length);
    a[N] = item; 
    N++;
  }

  // delete and return a random item
  public Item dequeue() {
    if (N == 0) throw new java.util.NoSuchElementException();
    int r = StdRandom.uniform(N);
    Item entry = a[r];
    a[r] = a[N];
    a[N] = null;
    N--;
    if (N > 0 && N == a.length/4) resize(a.length/2);
    return entry;
  }

  // return (but do not delete) a random item
  public Item sample() {
    if (N == 0) throw new java.util.NoSuchElementException();
    int r = StdRandom.uniform(N);
    return a[r];
  } 

  // return an independent iterator over items in random order
  public Iterator<Item> iterator() {
    return new ItemIterator();
  }

  private void resize(int capacity) {
    Item[] temp = (Item[]) new Object[capacity];
    for (int i = 0; i < N; i++) {
      temp[i] = a[i];
    }
    a = temp;
  }

  private class ItemIterator implements Iterator<Item> {
    private int counter;
    private Item[] rlist;

    public ItemIterator() {
      counter = N;
      rlist = a;
      StdRandom.shuffle(rlist);
    }

    public boolean hasNext() {
      return counter != 0;
    }

    public void remove() {
      throw new java.lang.UnsupportedOperationException();
    }

    public Item next() {
      if (counter == 0) throw new java.lang.UnsupportedOperationException();
      counter--;
      return rlist[counter];
    }
  }
}
