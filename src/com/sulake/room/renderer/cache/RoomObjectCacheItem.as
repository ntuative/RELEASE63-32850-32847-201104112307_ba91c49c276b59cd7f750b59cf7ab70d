package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_556:RoomObjectLocationCacheItem = null;
      
      private var var_199:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_556 = new RoomObjectLocationCacheItem(param1);
         this.var_199 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_556;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_199;
      }
      
      public function dispose() : void
      {
         if(this.var_556 != null)
         {
            this.var_556.dispose();
            this.var_556 = null;
         }
         if(this.var_199 != null)
         {
            this.var_199.dispose();
            this.var_199 = null;
         }
      }
   }
}
