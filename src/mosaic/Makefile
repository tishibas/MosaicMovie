PROGRAM = gen_mosaic
GXX = g++
#CFLAGS = -Wall -g
CFLAGS = -Wall -O3
OBJS = MosaicFactory.o Mosaic.o MosaicInfoElem.o EachDiffMosaicFactory.o YUVMosaicFactory.o
OPENCV = `pkg-config --cflags --libs opencv`


$(PROGRAM): main.cpp $(OBJS)
	$(GXX) $(CFLAGS) -o $(PROGRAM) $^ $(OPENCV) 

MosaicFactory.o: MosaicFactory.cpp
	$(GXX) $(CFLAGS) -c $<

EachDiffMosaicFactory.o: EachDiffMosaicFactory.cpp
	$(GXX) $(CFLAGS) -c $<

YUVMosaicFactory.o: YUVMosaicFactory.cpp
	$(GXX) $(CFLAGS) -c $<
	
Mosaic.o: Mosaic.cpp
	$(GXX) $(CFLAGS) -c $<
	
MosaicInfoElem.o: MosaicInfoElem.cpp
	$(GXX) $(CFLAGS) -c $<

clean:
	rm -rf $(PROGRAM) $(OBJS)
