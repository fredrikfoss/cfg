BUILD_DIR := build
SRC_DIR := src

.PHONY: all compile flash clean

all: compile flash clean

compile:
	arduino-cli compile --output-dir $(BUILD_DIR) $(SRC_DIR)

flash:
	arduino-cli upload --input-dir $(BUILD_DIR) $(SRC_DIR)

clean:
	rm -rf $(BUILD_DIR)
