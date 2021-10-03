package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      private static var var_553:uint = 0;
      
      private static var var_554:uint = 0;
      
      private static const const_1810:uint = 16777215;
       
      
      private var var_413:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         super(param2,param3,param4,param5);
         ++var_553;
         var_554 += param2 * param3 * 4;
         this.var_413 = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_553;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_554;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_554 -= width * height * 4;
            --var_553;
            super.dispose();
            this._disposed = true;
            this.var_413 = null;
         }
      }
   }
}
