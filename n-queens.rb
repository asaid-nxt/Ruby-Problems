# frozen_string_literal: true

# N-Queens Problem
def solve_n_queens(n)
  @result = []
  arr = Array.new(n) { '.' * n }
  total_n_queens(n, 0, [], [], [], arr)
  @result
end

def total_n_queens(n, row, columns, diagonals1, diagonals2, arr)
  # Found a Solution
  if row == n
    @result << arr.map(&:dup)
    return
  end

  (0...n).each do |col|
    f_diag = row - col
    s_diag = row + col

    next if columns.include?(col) || diagonals1.include?(f_diag) || diagonals2.include?(s_diag)

    # Place The Queen
    arr[row][col] = 'Q'
    columns.push(col)
    diagonals1.push(f_diag)
    diagonals2.push(s_diag)

    total_n_queens(n, row + 1, columns, diagonals1, diagonals2, arr)

    # Backtracking
    arr[row][col] = '.'
    columns.pop
    diagonals1.pop
    diagonals2.pop
  end
end
