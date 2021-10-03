package com.sulake.habbo.widget.playlisteditor
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   
   public class MusicInventoryGridItem
   {
      
      public static const const_489:int = 0;
      
      public static const const_1133:int = 1;
      
      public static const const_1224:int = 2;
      
      private static const const_1290:uint = 14612159;
      
      private static const const_1289:uint = 15856113;
       
      
      private var _widget:PlayListEditorWidget;
      
      private var _window:IWindowContainer;
      
      private var var_2541:int;
      
      private var var_1841:int;
      
      private var var_2542:IContainerButtonWindow = null;
      
      private var _buttonState:int;
      
      public function MusicInventoryGridItem(param1:PlayListEditorWidget, param2:int, param3:int, param4:String, param5:ColorTransform)
      {
         super();
         this._widget = param1;
         this.var_2541 = param2;
         this.var_1841 = param3;
         this.createWindow();
         this.deselect();
         if(param4 != null && param5 != null)
         {
            this.trackName = param4;
            this.diskColor = param5;
         }
      }
      
      public function get window() : IWindow
      {
         return this._window as IWindow;
      }
      
      public function get diskId() : int
      {
         return this.var_2541;
      }
      
      public function get songId() : int
      {
         return this.var_1841;
      }
      
      public function get toPlayListButton() : IContainerButtonWindow
      {
         return this.var_2542;
      }
      
      public function get playButtonState() : int
      {
         return this._buttonState;
      }
      
      public function update(param1:int, param2:String, param3:ColorTransform) : void
      {
         if(param1 == this.var_1841)
         {
            this.trackName = param2;
            this.diskColor = param3;
         }
      }
      
      private function createWindow() : void
      {
         var _loc3_:* = null;
         if(this._widget == null)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("playlisteditor_music_inventory_item") as XmlAsset;
         this._window = this._widget.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var _loc2_:IWindowContainer = this._window.getChildByName("action_buttons") as IWindowContainer;
         if(_loc2_ != null)
         {
            this.var_2542 = _loc2_.getChildByName("button_to_playlist") as IContainerButtonWindow;
         }
         _loc3_ = this._widget.assets.getAssetByName("icon_arrow") as BitmapDataAsset;
         if(_loc3_ != null)
         {
            if(_loc3_.content != null)
            {
               this.buttonToPlaylistBitmap = _loc3_.content as BitmapData;
            }
         }
         this.playButtonState = const_489;
      }
      
      public function select() : void
      {
         var _loc1_:IBorderWindow = this._window.getChildByName("background") as IBorderWindow;
         if(_loc1_ != null)
         {
            _loc1_.color = const_1290;
         }
         var _loc2_:IWindowContainer = this._window.getChildByName("action_buttons") as IWindowContainer;
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
         var _loc3_:IBorderWindow = this._window.getChildByName("selected") as IBorderWindow;
         if(_loc3_ != null)
         {
            _loc3_.visible = true;
         }
      }
      
      public function deselect() : void
      {
         var _loc1_:IBorderWindow = this._window.getChildByName("background") as IBorderWindow;
         if(_loc1_ != null)
         {
            _loc1_.color = const_1289;
         }
         var _loc2_:IWindowContainer = this._window.getChildByName("action_buttons") as IWindowContainer;
         if(_loc2_ != null)
         {
            _loc2_.visible = false;
         }
         var _loc3_:IBorderWindow = this._window.getChildByName("selected") as IBorderWindow;
         if(_loc3_ != null)
         {
            _loc3_.visible = false;
         }
      }
      
      public function set diskColor(param1:ColorTransform) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:BitmapDataAsset = this._widget.assets.getAssetByName("icon_cd_big") as BitmapDataAsset;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.content != null)
         {
            _loc3_ = _loc2_.content as BitmapData;
            _loc4_ = _loc3_.clone();
            if(_loc4_ != null)
            {
               _loc4_.colorTransform(_loc3_.rect,param1);
               this.diskIconBitmap = _loc4_;
            }
         }
      }
      
      public function set playButtonState(param1:int) : void
      {
         var _loc2_:* = null;
         if(param1 == const_489)
         {
            _loc2_ = this._widget.assets.getAssetByName("icon_play") as BitmapDataAsset;
         }
         else if(param1 == const_1133)
         {
            _loc2_ = this._widget.assets.getAssetByName("icon_pause") as BitmapDataAsset;
         }
         else if(param1 == const_1224)
         {
            _loc2_ = this._widget.assets.getAssetByName("icon_download") as BitmapDataAsset;
         }
         if(_loc2_ != null)
         {
            if(_loc2_.content != null)
            {
               this.buttonPlayPauseBitmap = _loc2_.content as BitmapData;
            }
         }
         this._buttonState = param1;
      }
      
      public function set trackName(param1:String) : void
      {
         var _loc2_:ITextWindow = this._window.getChildByName("song_title_text") as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.text = param1;
         }
      }
      
      private function set diskIconBitmap(param1:BitmapData) : void
      {
         var _loc2_:IBitmapWrapperWindow = this._window.getChildByName("disk_image") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = param1;
         }
      }
      
      private function set buttonToPlaylistBitmap(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this._window.getChildByName("action_buttons") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_ = _loc2_.getChildByName("button_to_playlist") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _loc2_.getChildByName("image_button_to_playlist") as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = param1.clone();
            _loc3_.width = param1.width;
            _loc3_.height = param1.height;
         }
      }
      
      private function set buttonPlayPauseBitmap(param1:BitmapData) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this._window.getChildByName("action_buttons") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_ = _loc2_.getChildByName("button_play_pause") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = _loc2_.getChildByName("image_button_play_pause") as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            _loc3_.bitmap = param1.clone();
            _loc3_.width = param1.width;
            _loc3_.height = param1.height;
         }
      }
   }
}
