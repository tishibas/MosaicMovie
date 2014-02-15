#ifndef INCLUDED_EACHDIFFMOSAICFACTORY
#define INCLUDED_EACHDIFFMOSAICFACTORY

#include "MosaicFactory.hpp"

class EachDiffMosaicFactory : public MosaicFactory {
public:
    EachDiffMosaicFactory();
    ~EachDiffMosaicFactory();
    std::string getSimilarImg(cv::Mat& patch);
};

#endif
