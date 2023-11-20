/// Remove duplicates from sorted array
///
/// Returns the length of unique elements, contained in the given list.
int removeDuplicates(List<int> numbers) {
  if (numbers.isEmpty || numbers.length == 1) return numbers.length;

  // Space Complexity: O(1)
  // * Determine variables or data structures that consume memory
  // * Determine how the memory usage scales with the size of the input
  var k = 1;

  // Time Complexity: O(n)
  // * Basic Operation: Comparison (numbers[i] > numbers[i+1]) inside the loop
  // * The loop runs n times, where n is the length of the list
  for (int i = 0; i < numbers.length - 1; i++) {
    if (numbers[i] != numbers[i + 1]) {
      numbers[k] = numbers[i + 1];
      k++;
    }
  }

  return k;
}

/// Dart exercise: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
///
/// * Understand sort algorithm and in-place:
/// https://en.wikipedia.org/wiki/In-place_algorithm
void main() {
  // Input array
  final numbers = [1, 1, 2, 2, 2, 3, 4, 4, 5, 5, 5];

  // The expected answer with correct length
  final expectedNumbers = [1, 2, 3, 4, 5];

  int k = removeDuplicates(numbers);

  print("Is k as expected? - ${k == expectedNumbers.length}");
  for (int i = 0; i < k; i++) {
    final isAsExpected = numbers[i] == expectedNumbers[i];
    print("Is the ${i + 1}. entry as expected? - $isAsExpected");
  }
}
