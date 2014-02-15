#ifndef INCLUDED_YUVMOSAICFACTORY
#define INCLUDED_YUVMOSAICFACTORY

#include "MosaicFactory.hpp"

class YUVMosaicFactory : public MosaicFactory {
public:
    YUVMosaicFactory();
    ~YUVMosaicFactory();
    std::string getSimilarImg(cv::Mat& patch);
};

#endif
