package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_771:TileHeightMap = null;
      
      private var var_1181:LegacyWallGeometry = null;
      
      private var var_1180:RoomCamera = null;
      
      private var var_773:SelectedRoomObjectData = null;
      
      private var var_772:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_518:Map;
      
      private var var_517:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_518 = new Map();
         this.var_517 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1181 = new LegacyWallGeometry();
         this.var_1180 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get method_4() : TileHeightMap
      {
         return this.var_771;
      }
      
      public function set method_4(param1:TileHeightMap) : void
      {
         if(this.var_771 != null)
         {
            this.var_771.dispose();
         }
         this.var_771 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1181;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1180;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_773;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_773 != null)
         {
            this.var_773.dispose();
         }
         this.var_773 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_772;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_772 != null)
         {
            this.var_772.dispose();
         }
         this.var_772 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_771 != null)
         {
            this.var_771.dispose();
            this.var_771 = null;
         }
         if(this.var_1181 != null)
         {
            this.var_1181.dispose();
            this.var_1181 = null;
         }
         if(this.var_1180 != null)
         {
            this.var_1180.dispose();
            this.var_1180 = null;
         }
         if(this.var_773 != null)
         {
            this.var_773.dispose();
            this.var_773 = null;
         }
         if(this.var_772 != null)
         {
            this.var_772.dispose();
            this.var_772 = null;
         }
         if(this.var_518 != null)
         {
            this.var_518.dispose();
            this.var_518 = null;
         }
         if(this.var_517 != null)
         {
            this.var_517.dispose();
            this.var_517 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_518.remove(param1.id);
            this.var_518.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_518.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_518.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_518.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_517.remove(param1.id);
            this.var_517.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_517.length > 0)
         {
            return this.getWallItemDataWithId(this.var_517.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_517.remove(param1);
      }
   }
}
