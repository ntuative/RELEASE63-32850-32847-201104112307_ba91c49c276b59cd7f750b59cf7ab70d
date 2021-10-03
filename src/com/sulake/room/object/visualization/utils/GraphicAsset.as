package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1969:String;
      
      private var var_2533:String;
      
      private var var_436:BitmapDataAsset;
      
      private var var_1466:Boolean;
      
      private var var_1465:Boolean;
      
      private var var_2532:Boolean;
      
      private var _offsetX:int;
      
      private var var_1097:int;
      
      private var var_267:int;
      
      private var _height:int;
      
      private var var_823:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1969 = param1;
         this.var_2533 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_436 = _loc9_;
            this.var_823 = false;
         }
         else
         {
            this.var_436 = null;
            this.var_823 = true;
         }
         this.var_1466 = param4;
         this.var_1465 = param5;
         this._offsetX = param6;
         this.var_1097 = param7;
         this.var_2532 = param8;
      }
      
      public function dispose() : void
      {
         this.var_436 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_823 && this.var_436 != null)
         {
            _loc1_ = this.var_436.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_267 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_823 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1465;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1466;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_267;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1969;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2533;
      }
      
      public function get asset() : IAsset
      {
         return this.var_436;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2532;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1466)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1465)
         {
            return this.var_1097;
         }
         return -(this.height + this.var_1097);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1097;
      }
   }
}
