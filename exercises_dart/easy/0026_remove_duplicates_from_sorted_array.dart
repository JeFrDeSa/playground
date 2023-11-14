/// Remove Duplicates from Sorted Array
///
/// Returns the length of unique elements, contained in the given list.
int removeDuplicates(List<int> numbers) {
  int currentValue = numbers.first;
  int replacementCount = 0;

  int start = 0;
  void determineStart() {
    start = numbers.indexWhere((element) => element == currentValue);
  }

  int end = 0;
  void determineEnd() {
    end = numbers.lastIndexWhere((element) => element == currentValue);
  }

  void determineReplacementCount() {
    if (start == end) return;
    replacementCount += end - start;
  }

  for (; end < numbers.length - 1; currentValue = numbers[end + 1]) {
    determineStart();
    determineEnd();
    determineReplacementCount();

    final replacementList = List<int>.generate(end - start, (index) => 101);
    numbers.replaceRange(
      start + 1,
      end + 1,
      replacementList,
    );

    if (end + 1 >= numbers.length) break;
  }

  numbers.sort();

  return numbers.length - replacementCount;
}

/// Dart exercise: https://leetcode.com/problems/remove-duplicates-from-sorted-array/
///
/// * Understand sort algorithm and in-place:
/// https://en.wikipedia.org/wiki/In-place_algorithm
void main() {
  final numbers = [1, 1]; // Input array
  final expectedNumbers = [1]; // The expected answer with correct length

  int k = removeDuplicates(numbers); // Calls your implementation

  print("Is k as expected? - ${k == expectedNumbers.length}");
  for (int i = 0; i < k; i++) {
    final isAsExpected = numbers[i] == expectedNumbers[i];
    print("Is the ${i + 1}. entry as expected? - $isAsExpected");
  }
}
