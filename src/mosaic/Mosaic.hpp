#ifndef INCLUDED_MOSAIC
#define INCLUDED_MOSAIC

#include "MosaicInfoElem.hpp"
#include <vector>

class Mosaic {
    std::vector<MosaicInfoElem> infos;
    public:
        Mosaic(int rows, int cols);
        ~Mosaic();
        void outputMosaicInfo();
    private:
        int _rows;
        int _cols;
};


#endif
