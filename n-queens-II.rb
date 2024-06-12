# frozen_string_literal: true

# N-Queens II Problem
def total_n_queens(n)
  @result = 0
  solve_n_queens(n)
  @result
end

def solve_n_queens(n, row = 0, columns = [], diagonals1 = [], diagonals2 = [])
  # Found a Solution
  if row == n
    @result += 1
    return
  end

  (0...n).each do |col|
    f_diag = row - col
    s_diag = row + col

    next if columns.include?(col) || diagonals1.include?(f_diag) || diagonals2.include?(s_diag)

    # Place The Queen
    columns.push(col)
    diagonals1.push(f_diag)
    diagonals2.push(s_diag)

    solve_n_queens(n, row + 1, columns, diagonals1, diagonals2)

    # Backtracking
    columns.pop
    diagonals1.pop
    diagonals2.pop
  end
end

