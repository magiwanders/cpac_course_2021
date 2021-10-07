(
SynthDef(\simpleOsc, {
	arg freq = 440, amp = 0.2, effectWeight = 0.5;
	var source, out=[0, 0];
	source = [SinOsc.ar(freq, 0, amp), SinOsc.ar(freq, 0, amp)];
	Out.ar(out, Balance2.ar(source[0], source[1], effectWeight));
}).add;
)

s = Synth(\simpleOsc);

(
l = OSCFunc({
	arg msg;
	s.set(\freq, msg[1]);
}, '/frequency', n);
)


(
m = OSCFunc({
	arg msg;
	s.set(\amp, msg[1]);
}, '/volume', n);
)


(
n = OSCFunc({
	arg msg;
	s.set(\effectWeight, msg[1]);
}, '/effect', n);
)

s.set(\effectWeight, 0);

OSCFunc.trace(false)
NetAddr.localAddr

s.free
l.free
m.free
n.free