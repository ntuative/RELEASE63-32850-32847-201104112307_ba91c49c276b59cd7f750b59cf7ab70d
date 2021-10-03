package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_994:int = 3;
       
      
      private var var_2544:int = -1;
      
      private var var_2547:int = -2;
      
      private var var_229:Vector3d = null;
      
      private var var_203:Vector3d = null;
      
      private var var_1845:Vector3d;
      
      private var var_2553:Boolean = false;
      
      private var var_2550:Boolean = false;
      
      private var var_2549:Boolean = false;
      
      private var var_2545:Boolean = false;
      
      private var var_2548:int = 0;
      
      private var var_2552:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2551:int = 0;
      
      private var var_2546:int = 0;
      
      private var var_1798:int = -1;
      
      private var var_1443:int = 0;
      
      private var var_1846:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1845 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_203;
      }
      
      public function get targetId() : int
      {
         return this.var_2544;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2547;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1845;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2553;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2550;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2549;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2545;
      }
      
      public function get screenWd() : int
      {
         return this.var_2548;
      }
      
      public function get screenHt() : int
      {
         return this.var_2552;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2551;
      }
      
      public function get roomHt() : int
      {
         return this.var_2546;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1798;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_229 != null && this.var_203 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2544 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1845.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2547 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2553 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2550 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2549 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2545 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2548 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2552 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1846 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2551 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2546 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1798 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_229 == null)
         {
            this.var_229 = new Vector3d();
         }
         if(this.var_229.x != param1.x || this.var_229.y != param1.y || this.var_229.z != param1.z)
         {
            this.var_229.assign(param1);
            this.var_1443 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_229 = null;
         this.var_203 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_203 != null)
         {
            return;
         }
         this.var_203 = new Vector3d();
         this.var_203.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_203 == null)
         {
            this.var_203 = new Vector3d();
         }
         this.var_203.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_229 != null && this.var_203 != null)
         {
            ++this.var_1443;
            if(this.var_1846)
            {
               this.var_1846 = false;
               this.var_203 = this.var_229;
               this.var_229 = null;
               return;
            }
            _loc4_ = Vector3d.dif(this.var_229,this.var_203);
            if(_loc4_.length <= param2)
            {
               this.var_203 = this.var_229;
               this.var_229 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_994 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1443 <= const_994)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_203 = Vector3d.sum(this.var_203,_loc4_);
            }
         }
      }
   }
}
