BUILD_DIR = build

.PHONY: all compile flash clean

all: compile flash clean

compile:
	arduino-cli compile --output-dir $(BUILD_DIR) .

flash:
	arduino-cli upload --input-dir $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
