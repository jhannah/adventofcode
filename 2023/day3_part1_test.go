package day3_part1

// Stolen from https://github.com/silverark/advent-of-code-2023/blob/master/day3/part1/part1_test.go

import (
	"log"
	"testing"

	"go_pkg/file"
)

/*
func main() {
	fmt.Println("Hello, World!")
}
*/

func TestProcess(t *testing.T) {
	value := process(file.GetFile("day3_test.txt"))

	expect := 4361
	if value != expect {
		t.Fatalf("Received %v, but expected %v", value, expect)
	}

	value = process(file.GetFile("day3.txt"))
	log.Println("The answer is", value)
}
