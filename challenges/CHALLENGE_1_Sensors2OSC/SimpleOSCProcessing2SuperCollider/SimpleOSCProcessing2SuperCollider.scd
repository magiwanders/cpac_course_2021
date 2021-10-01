NetAddr.langPort
NetAddr.localAddr

n = NetAddr.new("192.168.1.171", 1998)

o = OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, '/goodbye', n);
o.free;

b = NetAddr.new("127.0.1.1", 1998);    // create the NetAddr
b.sendMsg("/hello", "there");