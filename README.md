# SwiftABTest
This is a very basic Split Testing implemented in Swift. You can use A/B Testing and "A/B/C" testing. You can also have a weighted distribution for the A/B testing.

# Usage
Just use `CTSplitTest().runABTest(...)` - it uses a 50-50 weighted distribution by default but you can adjust it by using `CTSplitTest.runABTest([0.3,0.7],...)` to have a 30-70 weighted distribution.

# Measurement
You need to implement the measurement of the split testing yourself in the different group closures. You also need to send a new update to Apple if you want to change the implementation of the A/B test.

# Follow me
Follow me on Twitter if this code snippet was helpful for you -> @ctews

# PRs & Issues
Feel free to provide a PR with new features or leave an issue if you have troubles!
