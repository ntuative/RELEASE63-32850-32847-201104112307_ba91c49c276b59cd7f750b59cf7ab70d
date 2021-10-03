package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_783:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1065)
         {
            _structure = null;
            _assets = null;
            var_259 = null;
            var_287 = null;
            var_650 = null;
            var_565 = null;
            var_331 = null;
            if(!var_1318 && var_47)
            {
               var_47.dispose();
            }
            var_47 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_754 = null;
            var_1065 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_783[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_783[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_383:
               switch(_loc3_)
               {
                  case AvatarAction.const_732:
                  case AvatarAction.const_515:
                  case AvatarAction.const_395:
                  case AvatarAction.const_920:
                  case AvatarAction.const_402:
                  case AvatarAction.const_889:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_330:
            case AvatarAction.DANCE:
            case AvatarAction.WAVE:
            case AvatarAction.const_795:
            case AvatarAction.const_762:
            case AvatarAction.const_812:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
