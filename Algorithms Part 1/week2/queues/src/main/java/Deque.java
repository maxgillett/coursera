import java.util.Iterator;
import java.util.NoSuchElementException;
import java.lang.NullPointerException;

public class Deque<Item> implements Iterable<Item> {

  private int N;
  private Node first, last;
  
  private static class Node<Item> {
    private Item item;
    private Node<Item> next;
    private Node<Item> prev;
  }

  // construct an empty deque
  public Deque() {
    first = null; 
    last = first;
    N = 0;
  }

  // is the deque empty?
  public boolean isEmpty() {
    return first == null;
  }
  
  // return the number of items on the deque
  public int size() {
    return N;
  }

  // insert the item at the front
  public void addFirst(Item item) {
    if (item == null) throw new NullPointerException();
    Node<Item> oldfirst = first;
    first = new Node<Item>();
    first.item = item;
    first.next = oldfirst;
    first.prev = null;
    if (oldfirst != null) {
      oldfirst.prev = first;
    } else {
      last = first; // Is this even necessary? Or does last already point to first?
    }
    N++;
  }

  // insert the item at the end
  public void addLast(Item item) {
    if (item == null) throw new NullPointerException();
    Node<Item> oldLast = last;
    last = new Node<Item>();
    last.item = item;
    last.next = null;
    last.prev = oldLast;
    if (oldLast != null) {
      oldLast.next = last;
    } else {
      first = last;
    }
    N++;
  }

  // delete and return the item at the front
  public Item removeFirst() {
    if (N == 0) throw new NoSuchElementException();
    Node<Item> oldfirst = first;
    first = oldfirst.next;
    if (first == null) last = null;
    N--;
    return oldfirst.item;
  }

  // delete and return the item at the end
  public Item removeLast() {
    if (N == 0) throw new NoSuchElementException();
    Node<Item> oldlast = last;
    last = oldlast.prev;
    if (last == null) first = null;
    N--;
    return oldlast.item;
  }

  // return an iterator over items in order from front to end
  public Iterator<Item> iterator() {
    return new ItemIterator(); 
  }

  private class ItemIterator implements Iterator<Item> {
    private Node<Item> current = first;

    public boolean hasNext() {
      return current != null;
    }

    public void remove() { 
      throw new java.lang.UnsupportedOperationException();
    }

    public Item next() {
      if (current == null) throw new java.lang.UnsupportedOperationException();
      Item item = current.item;
      current = current.next;
      return item;
    }
  }

}
