public class Percolation {

  private int size;
  private int width;
  private int[] open;
  private WeightedQuickUnionUF uf;

  // create N-by-N grid, with all sites blocked
  public Percolation(int N) {
    size = N*N;
    width = N;
    open = new int[size];
    uf = new WeightedQuickUnionUF(size+2);
  }

  // open site (row i, column j) if it is not already
  public void open(int i, int j) {
    checkBounds(i, j);
    int num = ijTo1D(i, j);
    open[num] = 1;
    connectToOpenNeighbors(i, j);
  }

  // is site (row i, column j) open?
  public boolean isOpen(int i, int j) {
    checkBounds(i, j);
    int num = ijTo1D(i, j);
    return (open[num] == 1);
  }

  // is site (row i, column j) full?
  public boolean isFull(int i, int j) {
    checkBounds(i, j);
    return uf.connected(size, ijTo1D(i, j));
  }

  // does the system percolate?
  public boolean percolates() {
    return uf.connected(size, size+1);
  }

  private void connectToOpenNeighbors(int i, int j) {
    int index = ijTo1D(i, j);
    if (j < width) attemptUnion(i, j+1, index);
    if (j > 1) attemptUnion(i, j-1, index);

    if (i < width) {
      attemptUnion(i+1, j, index);
    } else {
      uf.union(index, size+1);
    }
    if (i > 1) {
      attemptUnion(i-1, j, index);
    } else {
      uf.union(index, size);
    }
  }

  private void attemptUnion(int i, int j, int index) {
    if (isOpen(i, j)) {
      uf.union(ijTo1D(i, j), index);
    }
  }

  // converts index in ij notation to a single 1D index (zero-indexed)
  private int ijTo1D(int i, int j) {
    return ((i*width - width) + j) - 1;
  }

  private void checkBounds(int i, int j) {
    if (i <= 0 || i > width) {
      throw new java.lang.IllegalArgumentException("row index i out of bounds");
    }
    if (j <= 0 || j > width) {
      throw new java.lang.IllegalArgumentException("row index i out of bounds");
    }
  }

  public static void main(String[] args) {
    Percolation perc = new Percolation(3);
    perc.open(1, 2);
    perc.open(2, 2);
    perc.open(2, 3);
    perc.open(3, 3);
    boolean c = perc.isFull(1, 1);
    //boolean c1 = perc.uf.connected(perc.ijTo1D(1, 1), perc.ijTo1D(2, 1));
    //boolean c2 = perc.percolates();
    StdOut.println(c);
    //StdOut.println(c1);
    //StdOut.println(c2);
  }

}
