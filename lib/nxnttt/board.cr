struct NxNTTT::Board
  getter n : Int32, marks : UInt128 = 0, occupancy : UInt128 = 0

  getter diagonal : UInt128 do
    (1...n).sum { |i| 1u128 << n * i + i } + 1
  end

  getter antidiagonal : UInt128 do
    (1..n).sum { |i| 1u128 << n * i - i }
  end

  def initialize(@n)
    raise "board size must be 1 <= N <= 11" unless 1 <= n <= 11
  end
end
