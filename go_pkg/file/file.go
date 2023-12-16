package file

// Stolen from https://github.com/silverark/advent-of-code-2023/blob/master/pkg/file/file.go

import (
	"os"
	"strings"
)

func GetFile(filename string) []string {
	dat, err := os.ReadFile(filename)
	if err != nil {
		panic("Unable to load file: " + err.Error())
	}
	return strings.Split(string(dat), "\n")
}

