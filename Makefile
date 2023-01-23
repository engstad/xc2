YOSYS ?= ~/Private/Tools/yosys/yosys
XC2PAR ?= ~/Private/Tools/openfpga/src/xc2par/target/debug/xc2par

.PRECIOUS: %.json

%.json: %.v
	yosys -p "synth_coolrunner2 -top top -json $@; write_verilog tmp.v" $<

%.jed: %.json
	$(XC2PAR) --part xc2c32a-6-vq44 -vv $<

all: 74x00.jed 74x02.jed 74x04.jed 74x07.jed 74x08.jed 74x10.jed 74x11.jed 74x13.jed 74x17.jed 74x18.jed 74x20.jed 74x42.jed 74x46.jed 74x69.jed

misc: adder.jed
fa: adder-fa.jed
iotest: iotest.jed
obuf-test: obuf-test.jed

clean:
	-rm *.json *.jed *~
