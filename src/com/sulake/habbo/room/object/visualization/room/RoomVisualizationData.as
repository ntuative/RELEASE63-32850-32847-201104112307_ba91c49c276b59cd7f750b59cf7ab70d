package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_506:WallRasterizer;
      
      private var var_505:FloorRasterizer;
      
      private var var_747:WallAdRasterizer;
      
      private var var_507:LandscapeRasterizer;
      
      private var var_748:PlaneMaskManager;
      
      private var var_823:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_506 = new WallRasterizer();
         this.var_505 = new FloorRasterizer();
         this.var_747 = new WallAdRasterizer();
         this.var_507 = new LandscapeRasterizer();
         this.var_748 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_823;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_505;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_506;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_747;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_507;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_748;
      }
      
      public function dispose() : void
      {
         if(this.var_506 != null)
         {
            this.var_506.dispose();
            this.var_506 = null;
         }
         if(this.var_505 != null)
         {
            this.var_505.dispose();
            this.var_505 = null;
         }
         if(this.var_747 != null)
         {
            this.var_747.dispose();
            this.var_747 = null;
         }
         if(this.var_507 != null)
         {
            this.var_507.dispose();
            this.var_507 = null;
         }
         if(this.var_748 != null)
         {
            this.var_748.dispose();
            this.var_748 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_506 != null)
         {
            this.var_506.clearCache();
         }
         if(this.var_505 != null)
         {
            this.var_505.clearCache();
         }
         if(this.var_507 != null)
         {
            this.var_507.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_506.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_505.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_747.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_507.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_748.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_823)
         {
            return;
         }
         this.var_506.initializeAssetCollection(param1);
         this.var_505.initializeAssetCollection(param1);
         this.var_747.initializeAssetCollection(param1);
         this.var_507.initializeAssetCollection(param1);
         this.var_748.initializeAssetCollection(param1);
         this.var_823 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
