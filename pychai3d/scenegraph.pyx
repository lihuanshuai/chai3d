from libcpp cimport bool
from _scenegraph cimport cGenericObject, cWorld


cdef class GenericObject:
    cdef cGenericObject* _this

    def __cinit__(self):
        cdef cGenericObject* go = NULL
        
        if type(self) != GenericObject:
            return
        with nogil:
            go = new cGenericObject()
        self._this = go
        if self._this is NULL:
            raise MemoryError()

    def __dealloc(self):
        if self._this is not NULL:
            del self._this
            self._this = NULL

    def add_child(self, GenericObject obj):
        self._this.addChild(obj._this)

    def compute_global_positions(self, bool a_frame_only=True):
        self._this.computeGlobalPositions(a_frame_only)


cdef class World(GenericObject):
    def __cinit__(self):
        cdef cGenericObject* w = NULL

        if type(self) != World:
            return
        with nogil:
            w = <cGenericObject*> new cWorld()
        self._this = w
        if self._this is NULL:
            raise MemoryError()
    
    def __dealloc(self):
        cdef cWorld* _world
        if self._this is not NULL:
            _world = <cWorld*> self._this
            del _world
            self._this = NULL

    def set_background_color(self, float r, float g, float b):
        (<cWorld*> self._this).setBackgroundColor(r, g, b)
