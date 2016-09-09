.SUFFIXES:
MAKEFLAGS+=-r

BUILD=build

SOURCES=$(wildcard src/*.cpp)
OBJECTS=$(SOURCES:%=$(BUILD)/%.o)

EXECUTABLE=$(BUILD)/meshoptimizer

CXXFLAGS=-g -Wall -std=c++11

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@

$(BUILD)/%.o: %
	@mkdir -p $(dir $@)
	$(CXX) $< $(CXXFLAGS) -c -MMD -MP -o $@

-include $(OBJECTS:.o=.d)
clean:
	rm -rf $(BUILD)

.PHONY: all clean