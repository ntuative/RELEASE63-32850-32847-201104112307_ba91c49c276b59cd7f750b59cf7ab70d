package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class FurniturePlane
   {
       
      
      private var var_1798:int = -1;
      
      private var var_1432:Number = 0.0;
      
      private var var_2376:Number = 0.0;
      
      private var var_2374:Number = 0.0;
      
      private var var_2378:Number = 0.0;
      
      private var var_1167:Vector3d = null;
      
      private var var_94:Vector3d = null;
      
      private var var_308:Vector3d = null;
      
      private var var_309:Vector3d = null;
      
      private var var_764:Vector3d = null;
      
      private var var_765:Vector3d = null;
      
      private var var_626:Vector3d = null;
      
      private var _isVisible:Boolean = true;
      
      private var _bitmapData:BitmapData = null;
      
      private var var_201:Map = null;
      
      private var _offset:Point = null;
      
      private var var_2498:Number = 0;
      
      private var _color:uint = 0;
      
      private var var_2497:Boolean = false;
      
      private var _id:String = null;
      
      private var var_154:Vector3d = null;
      
      private var var_114:Vector3d = null;
      
      private var var_85:Vector3d = null;
      
      private var var_115:Vector3d = null;
      
      private var var_267:Number = 0.0;
      
      private var _height:Number = 0.0;
      
      public function FurniturePlane(param1:IVector3d, param2:IVector3d, param3:IVector3d)
      {
         super();
         this.var_1167 = new Vector3d();
         this.var_94 = new Vector3d();
         this.var_94.assign(param1);
         this.var_308 = new Vector3d();
         this.var_308.assign(param2);
         this.var_309 = new Vector3d();
         this.var_309.assign(param3);
         this.var_764 = new Vector3d();
         this.var_764.assign(param2);
         this.var_765 = new Vector3d();
         this.var_765.assign(param3);
         this.var_626 = Vector3d.crossProduct(this.var_308,this.var_309);
         if(this.var_626.length > 0)
         {
            this.var_626.mul(1 / this.var_626.length);
         }
         this._offset = new Point();
         this.var_154 = new Vector3d();
         this.var_114 = new Vector3d();
         this.var_85 = new Vector3d();
         this.var_115 = new Vector3d();
         this.var_201 = new Map();
      }
      
      public function get bitmapData() : BitmapData
      {
         if(this._isVisible)
         {
            if(this._bitmapData != null)
            {
               return this._bitmapData.clone();
            }
         }
         return null;
      }
      
      public function get visible() : Boolean
      {
         return this._isVisible;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_2498;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         this._color = param1;
      }
      
      public function get leftSide() : IVector3d
      {
         return this.var_308;
      }
      
      public function get rightSide() : IVector3d
      {
         return this.var_309;
      }
      
      public function get location() : IVector3d
      {
         return this.var_94;
      }
      
      public function get normal() : IVector3d
      {
         return this.var_626;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this._bitmapData != null)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
         }
         if(this.var_201 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_201.length)
            {
               _loc2_ = this.var_201.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_201.dispose();
            this.var_201 = null;
         }
         this.var_1167 = null;
         this.var_94 = null;
         this.var_308 = null;
         this.var_309 = null;
         this.var_764 = null;
         this.var_765 = null;
         this.var_626 = null;
         this.var_154 = null;
         this.var_114 = null;
         this.var_85 = null;
         this.var_115 = null;
      }
      
      public function setRotation(param1:Boolean) : void
      {
         if(param1 != this.var_2497)
         {
            if(!param1)
            {
               this.var_308.assign(this.var_764);
               this.var_309.assign(this.var_765);
            }
            else
            {
               this.var_308.assign(this.var_764);
               this.var_308.mul(this.var_765.length / this.var_764.length);
               this.var_309.assign(this.var_765);
               this.var_309.mul(this.var_764.length / this.var_765.length);
            }
            this.var_1798 = -1;
            this.var_1432 = this.var_1432 - 1;
            this.var_2497 = param1;
            this.resetTextureCache();
         }
      }
      
      private function cacheTexture(param1:String, param2:BitmapData) : Boolean
      {
         var _loc3_:BitmapData = this.var_201.remove(param1) as BitmapData;
         if(_loc3_ != null && param2 != _loc3_)
         {
            _loc3_.dispose();
         }
         this.var_201.add(param1,param2);
         return true;
      }
      
      private function resetTextureCache() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_201 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_201.length)
            {
               _loc2_ = this.var_201.getWithIndex(_loc1_) as BitmapData;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.var_201.reset();
         }
      }
      
      private function getTextureIdentifier(param1:IRoomGeometry) : String
      {
         if(param1 == null)
         {
            return null;
         }
         return String(param1.scale);
      }
      
      private function needsNewTexture(param1:IRoomGeometry) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = this.getTextureIdentifier(param1);
         var _loc3_:BitmapData = this.var_201.getValue(_loc2_) as BitmapData;
         if(this.var_267 > 0 && this._height > 0)
         {
            if(_loc3_ == null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function getTexture(param1:IRoomGeometry, param2:int) : BitmapData
      {
         var _loc5_:* = NaN;
         var _loc6_:* = NaN;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = this.getTextureIdentifier(param1);
         var _loc4_:* = null;
         if(this.needsNewTexture(param1))
         {
            _loc5_ = Number(this.var_308.length * param1.scale);
            _loc6_ = Number(this.var_309.length * param1.scale);
            if(_loc5_ < 1)
            {
               _loc5_ = 1;
            }
            if(_loc6_ < 1)
            {
               _loc6_ = 1;
            }
            _loc7_ = param1.getCoordinatePosition(this.var_626);
            _loc4_ = this.var_201.getValue(_loc3_) as BitmapData;
            if(_loc4_ == null)
            {
               _loc4_ = new BitmapData(_loc5_,_loc6_,true,4278190080 | this._color);
               if(_loc4_ != null)
               {
                  this.cacheTexture(_loc3_,_loc4_);
               }
            }
         }
         else
         {
            _loc4_ = this.var_201.getValue(_loc3_) as BitmapData;
         }
         if(_loc4_ != null)
         {
            return _loc4_;
         }
         return null;
      }
      
      public function update(param1:IRoomGeometry, param2:int) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:* = NaN;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         if(param1 == null || this.var_94 == null && this.var_1167 != null || this.var_308 == null || this.var_309 == null || this.var_626 == null)
         {
            return false;
         }
         var _loc3_:Boolean = false;
         if(param1.updateId != this.var_1798)
         {
            this.var_1798 = param1.updateId;
            _loc4_ = param1.direction;
            if(_loc4_ != null && (_loc4_.x != this.var_1432 || _loc4_.y != this.var_2376 || _loc4_.z != this.var_2374 || param1.scale != this.var_2378))
            {
               this.var_1432 = _loc4_.x;
               this.var_2376 = _loc4_.y;
               this.var_2374 = _loc4_.z;
               this.var_2378 = param1.scale;
               _loc3_ = true;
               _loc5_ = 0;
               _loc5_ = Number(Vector3d.cosAngle(param1.directionAxis,this.normal));
               if(_loc5_ > -0.001)
               {
                  if(this._isVisible)
                  {
                     this._isVisible = false;
                     return true;
                  }
                  return false;
               }
               this.updateCorners(param1);
               _loc6_ = param1.getScreenPosition(this.var_1167);
               _loc7_ = _loc6_.z;
               _loc8_ = Math.max(this.var_154.z - _loc7_,this.var_114.z - _loc7_,this.var_85.z - _loc7_,this.var_115.z - _loc7_);
               this.var_2498 = _loc8_;
               this._isVisible = true;
            }
         }
         if(this.needsNewTexture(param1) || _loc3_)
         {
            if(this._bitmapData == null || this.var_267 != this._bitmapData.width || this._height != this._bitmapData.height)
            {
               if(this._bitmapData != null)
               {
                  this._bitmapData.dispose();
                  this._bitmapData = null;
                  if(this.var_267 < 1 || this._height < 1)
                  {
                     return true;
                  }
               }
               else if(this.var_267 < 1 || this._height < 1)
               {
                  return false;
               }
               this._bitmapData = new BitmapData(this.var_267,this._height,true,16777215);
               this._bitmapData.lock();
            }
            else
            {
               this._bitmapData.lock();
               this._bitmapData.fillRect(this._bitmapData.rect,16777215);
            }
            _loc9_ = this.getTexture(param1,param2);
            if(_loc9_ != null)
            {
               this.renderTexture(param1,_loc9_);
            }
            this._bitmapData.unlock();
            return true;
         }
         return false;
      }
      
      private function updateCorners(param1:IRoomGeometry) : void
      {
         this.var_154.assign(param1.getScreenPosition(this.var_94));
         this.var_114.assign(param1.getScreenPosition(Vector3d.sum(this.var_94,this.var_309)));
         this.var_85.assign(param1.getScreenPosition(Vector3d.sum(Vector3d.sum(this.var_94,this.var_308),this.var_309)));
         this.var_115.assign(param1.getScreenPosition(Vector3d.sum(this.var_94,this.var_308)));
         this._offset = param1.getScreenPoint(this.var_1167);
         this.var_154.x = Math.round(this.var_154.x);
         this.var_154.y = Math.round(this.var_154.y);
         this.var_114.x = Math.round(this.var_114.x);
         this.var_114.y = Math.round(this.var_114.y);
         this.var_85.x = Math.round(this.var_85.x);
         this.var_85.y = Math.round(this.var_85.y);
         this.var_115.x = Math.round(this.var_115.x);
         this.var_115.y = Math.round(this.var_115.y);
         this._offset.x = Math.round(this._offset.x);
         this._offset.y = Math.round(this._offset.y);
         var _loc2_:Number = Math.min(this.var_154.x,this.var_114.x,this.var_85.x,this.var_115.x);
         var _loc3_:Number = Math.max(this.var_154.x,this.var_114.x,this.var_85.x,this.var_115.x);
         var _loc4_:Number = Math.min(this.var_154.y,this.var_114.y,this.var_85.y,this.var_115.y);
         var _loc5_:Number = Math.max(this.var_154.y,this.var_114.y,this.var_85.y,this.var_115.y);
         _loc3_ -= _loc2_;
         this._offset.x -= _loc2_;
         this.var_154.x -= _loc2_;
         this.var_114.x -= _loc2_;
         this.var_85.x -= _loc2_;
         this.var_115.x -= _loc2_;
         _loc5_ -= _loc4_;
         this._offset.y -= _loc4_;
         this.var_154.y -= _loc4_;
         this.var_114.y -= _loc4_;
         this.var_85.y -= _loc4_;
         this.var_115.y -= _loc4_;
         this.var_267 = _loc3_;
         this._height = _loc5_;
      }
      
      private function renderTexture(param1:IRoomGeometry, param2:BitmapData) : void
      {
         if(this.var_154 == null || this.var_114 == null || this.var_85 == null || this.var_115 == null || param2 == null || this._bitmapData == null)
         {
            return;
         }
         var _loc3_:Number = this.var_115.x - this.var_85.x;
         var _loc4_:Number = this.var_115.y - this.var_85.y;
         var _loc5_:Number = this.var_114.x - this.var_85.x;
         var _loc6_:Number = this.var_114.y - this.var_85.y;
         if(Math.abs(_loc5_ - param2.width) <= 1)
         {
            _loc5_ = param2.width;
         }
         if(Math.abs(_loc6_ - param2.width) <= 1)
         {
            _loc6_ = param2.width;
         }
         if(Math.abs(_loc3_ - param2.height) <= 1)
         {
            _loc3_ = param2.height;
         }
         if(Math.abs(_loc4_ - param2.height) <= 1)
         {
            _loc4_ = param2.height;
         }
         var _loc7_:Number = _loc5_ / param2.width;
         var _loc8_:Number = _loc6_ / param2.width;
         var _loc9_:Number = _loc3_ / param2.height;
         var _loc10_:Number = _loc4_ / param2.height;
         var _loc11_:Matrix = new Matrix();
         _loc11_.a = _loc7_;
         _loc11_.b = _loc8_;
         _loc11_.c = _loc9_;
         _loc11_.d = _loc10_;
         _loc11_.translate(this.var_85.x,this.var_85.y);
         this.draw(param2,_loc11_);
      }
      
      private function draw(param1:BitmapData, param2:Matrix) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = NaN;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._bitmapData != null)
         {
            if(param2.a == 1 && param2.d == 1 && param2.c == 0 && param2.b != 0 && Math.abs(param2.b) <= 1)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 0;
               _loc6_ = 0;
               if(param2.b > 0)
               {
                  ++param2.ty;
               }
               _loc7_ = 0;
               while(_loc3_ < param1.width)
               {
                  _loc3_++;
                  _loc5_ += Math.abs(param2.b);
                  if(_loc5_ >= 1)
                  {
                     this._bitmapData.copyPixels(param1,new Rectangle(_loc4_ + _loc6_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
                     _loc4_ = _loc3_;
                     if(param2.b > 0)
                     {
                        _loc7_++;
                     }
                     else
                     {
                        _loc7_--;
                     }
                     _loc5_ = 0;
                  }
               }
               if(_loc5_ > 0)
               {
                  this._bitmapData.copyPixels(param1,new Rectangle(_loc4_,0,_loc3_ - _loc4_,param1.height),new Point(param2.tx + _loc4_,param2.ty + _loc7_),null,null,true);
               }
               return;
            }
            this._bitmapData.draw(param1,param2,null,null,null,false);
         }
      }
   }
}
