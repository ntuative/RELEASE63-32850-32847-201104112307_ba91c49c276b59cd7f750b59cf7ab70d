package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationFrame
   {
      
      public static const const_464:int = -1;
      
      public static const const_1099:int = -1;
      
      private static const const_1454:int = 3000;
      
      private static const POOL:Array = [];
       
      
      private var _id:int = 0;
      
      private var _x:int = 0;
      
      private var var_160:int = 0;
      
      private var var_2777:int = 1;
      
      private var var_1048:int = 1;
      
      private var var_2038:int = 1;
      
      private var var_2848:int = -1;
      
      private var var_2847:int = 0;
      
      private var var_2849:Boolean = false;
      
      private var _isRecycled:Boolean = false;
      
      public function AnimationFrame()
      {
         super();
      }
      
      public static function allocate(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int = -1, param8:int = 0) : AnimationFrame
      {
         var _loc9_:AnimationFrame = false ? POOL.pop() : new AnimationFrame();
         _loc9_._isRecycled = false;
         _loc9_._id = param1;
         _loc9_._x = param2;
         _loc9_.var_160 = param3;
         _loc9_.var_2849 = param6;
         if(param4 < 1)
         {
            param4 = 1;
         }
         _loc9_.var_2777 = param4;
         if(param5 < 0)
         {
            param5 = const_464;
         }
         _loc9_.var_1048 = param5;
         _loc9_.var_2038 = param5;
         if(param7 >= 0)
         {
            _loc9_.var_2848 = param7;
            _loc9_.var_2847 = param8;
         }
         return _loc9_;
      }
      
      public function get id() : int
      {
         if(this._id >= 0)
         {
            return this._id;
         }
         return -this._id * Math.random();
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this.var_160;
      }
      
      public function get repeats() : int
      {
         return this.var_2777;
      }
      
      public function get frameRepeats() : int
      {
         return this.var_1048;
      }
      
      public function get isLastFrame() : Boolean
      {
         return this.var_2849;
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(this.var_1048 < 0)
         {
            return const_464;
         }
         return this.var_2038;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this.var_1048 > 0 && param1 > this.var_1048)
         {
            param1 = this.var_1048;
         }
         this.var_2038 = param1;
      }
      
      public function get activeSequence() : int
      {
         return this.var_2848;
      }
      
      public function get activeSequenceOffset() : int
      {
         return this.var_2847;
      }
      
      public function recycle() : void
      {
         if(!this._isRecycled)
         {
            this._isRecycled = true;
            if(POOL.length < const_1454)
            {
               POOL.push(this);
            }
         }
      }
   }
}
