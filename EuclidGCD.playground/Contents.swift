import UIKit

/*
 It is method of computing the Greatest Common Divisor (GCD) or HCF of two integers.
 we solve this problem by recursion (Decrease and Conquer strategy).
 Input: m = 40, n = 32  output: 8
 Input: m = 60, n = 40  output: 20
 Input: m = 0, n = 19  output: 19
 Input: m = 19, n = 0  output: 19
 if both zero:  Input: m = 0, n = 0  output: undefined (Arbitrarily large Number)
 if smaller of the two numbers can divide the large number then GCD is the smaller number: if m >> n  and m%n == 0 then outhput: n
 */

//Brust forse approch
func gcdBF(m: Int, n: Int) -> Int {
    guard m != 0 && n != 0 else {
        return n != 0 ? n : m != 0 ? m : Int.max
    }
    
    let min = min(m, n)
    if m % min == 0 && n % min == 0 {
        return min
    }
    
    for i in stride(from: min/2, to: 1, by: -1) {
        if m % i == 0 && n % i == 0 {
            return i
        }
    }
    return 1
}
print(gcdBF(m: 40, n: 32))
print(gcdBF(m: 60, n: 40))
print(gcdBF(m: 50, n: 22))
print(gcdBF(m: 20, n: 40))
print(gcdBF(m: 40, n: 20))
print(gcdBF(m: 0, n: 22))
print(gcdBF(m: 50, n: 0))
print(gcdBF(m: 0, n: 0))

//Decreasing input size by the differrence of both numbers
/*
 Suppose m > n and GCD(m, n) = x
 if x divides both m and n then it would also divide the number m-n
 m = ax
 n = bx
  a > b
 then m - n = ax - bx  = x(a-b) so (m-n)/x = a-b
 so if m > 0  and n > 0 so the common divisor of m and n would be same as the common divisor of m-n, adn n :: GCD(m, n) == CGD(m-n, n)
 Repeate (Recursive) this both numbers are equale in CGD
 GCD(48, 18) = GCD(48-18, 18)
 GCD(30, 18) = GCD(30-18, 18)
 GCD(12, 18) = GCD(12, 18-12)
 GCD(12, 6)  = GCD(12-6, 6)
 GCD(6, 6) = 6
 so GCD of 48, 18 is 6
 if one number large the method will slow
 */

func gcdDiffRec(m: Int, n: Int) -> Int {
    guard  m != 0 && n != 0 else {
        return n != 0 ? n : m != 0 ? m : Int.max
    }
    guard m != n else {
        return m
    }
    
    if m > n {
        return gcdDiffRec(m: m-n, n:n)
    }
    
    return gcdDiffRec(m: m, n: n - m)
}
print()
print("gcdDiffRec")
print(gcdDiffRec(m: 40, n: 32))
print(gcdDiffRec(m: 60, n: 40))
print(gcdDiffRec(m: 50, n: 22))
print(gcdDiffRec(m: 20, n: 40))
print(gcdDiffRec(m: 40, n: 20))
print(gcdDiffRec(m: 0, n: 22))
print(gcdDiffRec(m: 50, n: 0))
print(gcdDiffRec(m: 0, n: 0))
print(gcdDiffRec(m: 48, n: 18))

func gcdDiffIterative(m: Int, n: Int) -> Int {
    var mnew = m
    var nnew = n
    guard  mnew != 0 && nnew != 0 else {
        return nnew != 0 ? nnew : mnew != 0 ? mnew : Int.max
    }
    while mnew != nnew {
        if mnew > nnew {
            mnew = mnew - nnew
        } else {
            nnew = nnew - mnew
        }
    }
    
    return mnew
}

print()
print("gcdDiffIterative")
print(gcdDiffIterative(m: 40, n: 32))
print(gcdDiffIterative(m: 60, n: 40))
print(gcdDiffIterative(m: 50, n: 22))
print(gcdDiffIterative(m: 20, n: 40))
print(gcdDiffIterative(m: 40, n: 20))
print(gcdDiffIterative(m: 0, n: 22))
print(gcdDiffIterative(m: 50, n: 0))
print(gcdDiffIterative(m: 0, n: 0))
print(gcdDiffIterative(m: 48, n: 18))


/*
 
 Final Euclidean Algorithm Approch
    Where the difference of the two numbers m and n is replace by the remainder of the division of m by n.
 The GCD of the two integers m and n with m > n equals to GCD of n and m mod n (reminder when m divided by n m%n)
 GCD(m, n) = GCD(n, m mod n)
 Base case GCD(m, n) if n = 0
 Any number x that divides both m and n should divide m mod n as well.
    GCD(48, 18) =  GCD(18, 48 mod 18) = GCD(18, 12)
    GCD(18, 12) = GCD(12, 18 mod 12) = GCD(12, 6)
    GCD(12, 6) = GCD(6, 12 mod 6) = GCD(6, 0)
    GCD(6, 0) // Base case so answer is m = 6
 */

func euclideanGCD(m: Int, n: Int) -> Int {
    guard  n != 0 && m != 0 else {
        return n != 0 ? m : m != 0 ? m : Int.max
    }
    return gcdBF(m: n, n: m % n)
}


print()
print("euclideanGCD")
print(euclideanGCD(m: 40, n: 32))
print(euclideanGCD(m: 60, n: 40))
print(euclideanGCD(m: 50, n: 22))
print(euclideanGCD(m: 20, n: 40))
print(euclideanGCD(m: 40, n: 20))
print(euclideanGCD(m: 0, n: 22))
print(euclideanGCD(m: 50, n: 0))
print(euclideanGCD(m: 0, n: 0))
print(euclideanGCD(m: 48, n: 18))
