struct NxNTTT::Board
  getter n : Int32, marks : UInt128 = 0, occupancy : UInt128 = 0

  getter diagonal : UInt128 do
    (1...n).sum { |i| 1u128 << n * i + i } + 1
  end

  getter antidiagonal : UInt128 do
    (1..n).sum { |i| 1u128 << n * i - i }
  end

  getter rows : Array(UInt128) do
    Array.new(n) { |i| (1u128 << n) - 1 << n * i }
  end

  getter columns : Array(UInt128) do
    Array.new(n) { |i|
      (0...n).sum { |j| 1u128 << j * n + i }
    }
  end

  def initialize(@n)
    raise "board size must be 1 <= N <= 11" unless 1 <= n <= 11
  end
end
