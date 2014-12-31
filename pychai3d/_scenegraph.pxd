from libcpp cimport bool
from pychai3d._extras cimport cGenericType


cdef extern from "../src/scenegraph/CGenericObject.h" nogil:
    ctypedef enum chai_render_modes:
        CHAI_RENDER_MODE_RENDER_ALL
        CHAI_RENDER_MODE_NON_TRANSPARENT_ONLY
        CHAI_RENDER_MODE_TRANSPARENT_BACK_ONLY
        CHAI_RENDER_MODE_TRANSPARENT_FRONT_ONLY

    cdef cppclass cGenericObject(cGenericType):
        cGenericObject() except +
        void addChild(cGenericObject* a_object) except +
        void computeGlobalPositions(const bool a_frameOnly)


cdef extern from "../src/scenegraph/CWorld.h" nogil:
    cdef cppclass cWorld(cGenericObject):
        cWorld() except +
        void setBackgroundColor(const float a_red, const float a_green, const float a_blue) except +

