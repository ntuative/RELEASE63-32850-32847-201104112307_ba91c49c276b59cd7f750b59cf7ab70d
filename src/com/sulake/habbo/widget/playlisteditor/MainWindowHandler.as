package com.sulake.habbo.widget.playlisteditor
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IBorderWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.sound.HabboMusicPrioritiesEnum;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.NowPlayingEvent;
   import com.sulake.habbo.sound.events.PlayListStatusEvent;
   import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MainWindowHandler
   {
      
      private static const const_1281:int = 6;
      
      private static const const_1282:int = 9;
      
      private static const const_1283:int = 5;
       
      
      private var _widget:PlayListEditorWidget;
      
      private var var_69:IHabboMusicController;
      
      private var var_16:IWindowContainer;
      
      private var var_877:IBorderWindow;
      
      private var var_878:IBorderWindow;
      
      private var var_481:MusicInventoryGridView;
      
      private var var_708:PlayListEditorItemListView;
      
      private var var_197:MusicInventoryStatusView;
      
      private var var_218:PlayListStatusView;
      
      private var var_1613:IScrollbarWindow;
      
      private var var_1614:IScrollbarWindow;
      
      public function MainWindowHandler(param1:PlayListEditorWidget, param2:IHabboMusicController)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         this._widget = param1;
         this.var_69 = param2;
         var _loc3_:Array = [PlayListEditorWidgetAssetsEnum.const_945,PlayListEditorWidgetAssetsEnum.const_710,PlayListEditorWidgetAssetsEnum.const_568,PlayListEditorWidgetAssetsEnum.const_485,PlayListEditorWidgetAssetsEnum.const_705];
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = this._widget.getImageGalleryAssetBitmap(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.dispose();
            }
            else
            {
               this._widget.retrieveWidgetImage(_loc4_);
            }
         }
         this.createWindow();
         this.var_481 = new MusicInventoryGridView(param1,this.getMusicInventoryGrid(),param2);
         this.var_708 = new PlayListEditorItemListView(param1,this.getPlayListEditorItemList());
         this.var_197 = new MusicInventoryStatusView(param1,this.getMusicInventoryStatusContainer());
         this.var_218 = new PlayListStatusView(param1,this.getPlayListStatusContainer());
         this.refreshLoadableAsset();
         this.var_69.events.addEventListener(SongDiskInventoryReceivedEvent.const_491,this.onSongDiskInventoryReceivedEvent);
         this.var_69.events.addEventListener(PlayListStatusEvent.PLAY_LIST_UPDATED,this.onPlayListUpdatedEvent);
         this.var_69.events.addEventListener(PlayListStatusEvent.const_681,this.onPlayListFullEvent);
         this.var_69.events.addEventListener(NowPlayingEvent.const_303,this.onNowPlayingChanged);
         this.var_69.events.addEventListener(NowPlayingEvent.const_517,this.onNowPlayingChanged);
         this.var_69.events.addEventListener(NowPlayingEvent.const_606,this.onNowPlayingChanged);
      }
      
      public function get window() : IWindow
      {
         return this.var_16;
      }
      
      public function get musicInventoryView() : MusicInventoryGridView
      {
         return this.var_481;
      }
      
      public function get playListEditorView() : PlayListEditorItemListView
      {
         return this.var_708;
      }
      
      public function destroy() : void
      {
         if(this.var_69)
         {
            this.var_69.stop(HabboMusicPrioritiesEnum.const_416);
            this.var_69.events.removeEventListener(SongDiskInventoryReceivedEvent.const_491,this.onSongDiskInventoryReceivedEvent);
            this.var_69.events.removeEventListener(PlayListStatusEvent.PLAY_LIST_UPDATED,this.onPlayListUpdatedEvent);
            this.var_69.events.removeEventListener(PlayListStatusEvent.const_681,this.onPlayListFullEvent);
            this.var_69.events.removeEventListener(NowPlayingEvent.const_303,this.onNowPlayingChanged);
            this.var_69.events.removeEventListener(NowPlayingEvent.const_517,this.onNowPlayingChanged);
            this.var_69.events.removeEventListener(NowPlayingEvent.const_606,this.onNowPlayingChanged);
            this.var_69 = null;
         }
         if(this.var_481)
         {
            this.var_481.destroy();
            this.var_481 = null;
         }
         if(this.var_708)
         {
            this.var_708.destroy();
            this.var_708 = null;
         }
         if(this.var_218)
         {
            this.var_218.destroy();
            this.var_218 = null;
         }
         if(this.var_197)
         {
            this.var_197.destroy();
            this.var_197 = null;
         }
         this.var_16.destroy();
         this.var_16 = null;
      }
      
      public function hide() : void
      {
         this.var_16.visible = false;
         if(this._widget != null)
         {
            this._widget.stopUserSong();
         }
      }
      
      public function show() : void
      {
         this.var_69.requestUserSongDisks();
         var _loc1_:IPlayListController = this.var_69.getRoomItemPlaylist();
         if(_loc1_ != null)
         {
            _loc1_.requestPlayList();
            this.selectPlayListStatusViewByFurniPlayListState();
         }
         this.var_16.visible = true;
      }
      
      public function refreshLoadableAsset(param1:String = "") : void
      {
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_945)
         {
            this.assignWindowBitmapByAsset(this.var_877,"music_inventory_splash_image",PlayListEditorWidgetAssetsEnum.const_945);
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_710)
         {
            this.assignWindowBitmapByAsset(this.var_878,"playlist_editor_splash_image",PlayListEditorWidgetAssetsEnum.const_710);
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_568)
         {
            this.var_197.setPreviewPlayingBackgroundImage(this._widget.getImageGalleryAssetBitmap(PlayListEditorWidgetAssetsEnum.const_568));
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_485)
         {
            this.var_197.setGetMoreMusicBackgroundImage(this._widget.getImageGalleryAssetBitmap(PlayListEditorWidgetAssetsEnum.const_485));
         }
         if(param1 == "" || param1 == PlayListEditorWidgetAssetsEnum.const_705)
         {
            this.var_218.addSongsBackgroundImage = this._widget.getImageGalleryAssetBitmap(PlayListEditorWidgetAssetsEnum.const_705);
         }
      }
      
      private function assignWindowBitmapByAsset(param1:IWindowContainer, param2:String, param3:String) : void
      {
         var _loc5_:* = null;
         var _loc4_:IBitmapWrapperWindow = param1.getChildByName(param2) as IBitmapWrapperWindow;
         if(_loc4_ != null)
         {
            _loc5_ = this._widget.getImageGalleryAssetBitmap(param3);
            if(_loc5_ != null)
            {
               _loc4_.bitmap = _loc5_;
               _loc4_.width = _loc5_.width;
               _loc4_.height = _loc5_.height;
            }
         }
      }
      
      private function createWindow() : void
      {
         if(this._widget == null)
         {
            return;
         }
         var _loc1_:XmlAsset = this._widget.assets.getAssetByName("playlisteditor_main_window") as XmlAsset;
         Logger.log("Show window: " + _loc1_);
         this.var_16 = this._widget.windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         if(this.var_16 == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this.var_16.position = new Point(80,0);
         var _loc2_:IWindowContainer = this.var_16.getChildByName("content_area") as IWindowContainer;
         if(_loc2_ == null)
         {
            throw new Error("Window is missing \'content_area\' element");
         }
         this.var_877 = _loc2_.getChildByName("my_music_border") as IBorderWindow;
         this.var_878 = _loc2_.getChildByName("playlist_border") as IBorderWindow;
         if(this.var_877 == null)
         {
            throw new Error("Window content area is missing \'my_music_border\' window element");
         }
         if(this.var_878 == null)
         {
            throw new Error("Window content area is missing \'playlist_border\' window element");
         }
         this.var_1613 = this.var_877.getChildByName("music_inventory_scrollbar") as IScrollbarWindow;
         this.var_1614 = this.var_878.getChildByName("playlist_scrollbar") as IScrollbarWindow;
         if(this.var_1613 == null)
         {
            throw new Error("Window content area is missing \'music_inventory_scrollbar\' window element");
         }
         if(this.var_1614 == null)
         {
            throw new Error("Window content area is missing \'playlist_scrollbar\' window element");
         }
         var _loc3_:IWindow = this.var_16.findChildByTag("close");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
      }
      
      private function getMusicInventoryGrid() : IItemGridWindow
      {
         return this.var_877.getChildByName("music_inventory_itemgrid") as IItemGridWindow;
      }
      
      private function getPlayListEditorItemList() : IItemListWindow
      {
         return this.var_878.getChildByName("playlist_editor_itemlist") as IItemListWindow;
      }
      
      private function getMusicInventoryStatusContainer() : IWindowContainer
      {
         return this.var_877.getChildByName("preview_play_container") as IWindowContainer;
      }
      
      private function getPlayListStatusContainer() : IWindowContainer
      {
         return this.var_878.getChildByName("now_playing_container") as IWindowContainer;
      }
      
      private function selectPlayListStatusViewByFurniPlayListState() : void
      {
         var _loc1_:IPlayListController = this.var_69.getRoomItemPlaylist();
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isPlaying)
         {
            this.var_218.selectView(PlayListStatusView.const_585);
         }
         else if(_loc1_.length > 0)
         {
            this.var_218.selectView(PlayListStatusView.const_1213);
         }
         else
         {
            this.var_218.selectView(PlayListStatusView.const_733);
         }
      }
      
      private function selectMusicStatusViewByMusicState() : void
      {
         if(this.isPreviewPlaying())
         {
            this.var_197.show();
            this.var_197.selectView(MusicInventoryStatusView.const_658);
         }
         else if(this.var_69.getSongDiskInventorySize() <= const_1281)
         {
            this.var_197.show();
            this.var_197.selectView(MusicInventoryStatusView.const_774);
         }
         else
         {
            this.var_197.hide();
         }
      }
      
      private function updatePlaylistEditorView() : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc1_:IPlayListController = this.var_69.getRoomItemPlaylist();
         var _loc2_:* = [];
         var _loc3_:int = -1;
         if(_loc1_ != null)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc1_.length)
            {
               _loc5_ = _loc1_.getEntry(_loc4_);
               if(_loc5_ != null)
               {
                  _loc2_.push(_loc5_);
               }
               _loc4_++;
            }
            _loc3_ = _loc1_.playPosition;
         }
         this.var_708.refresh(_loc2_,_loc3_);
      }
      
      private function onPlayListUpdatedEvent(param1:PlayListStatusEvent) : void
      {
         var _loc4_:* = null;
         this.updatePlaylistEditorView();
         this.selectPlayListStatusViewByFurniPlayListState();
         var _loc2_:IPlayListController = this.var_69.getRoomItemPlaylist();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.nowPlayingSongId;
         if(_loc3_ != -1)
         {
            _loc4_ = this.var_69.getSongInfo(_loc3_);
            this.var_218.nowPlayingTrackName = _loc4_.name;
            this.var_218.nowPlayingAuthorName = _loc4_.creator;
         }
         this.var_1614.visible = _loc2_.length > const_1283;
      }
      
      private function onPlayListFullEvent(param1:PlayListStatusEvent) : void
      {
         this._widget.alertPlayListFull();
      }
      
      private function onSongDiskInventoryReceivedEvent(param1:SongDiskInventoryReceivedEvent) : void
      {
         this.var_481.refresh();
         this.selectMusicStatusViewByMusicState();
         this.var_1613.visible = this.var_481.itemCount > const_1282;
      }
      
      private function onNowPlayingChanged(param1:NowPlayingEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         switch(param1.type)
         {
            case NowPlayingEvent.const_303:
               this.selectPlayListStatusViewByFurniPlayListState();
               this.var_708.setItemIndexPlaying(param1.position);
               if(param1.id != -1)
               {
                  _loc3_ = this.var_69.getSongInfo(param1.id);
                  if(_loc3_ != null)
                  {
                     this.var_218.nowPlayingTrackName = _loc3_.name;
                     this.var_218.nowPlayingAuthorName = _loc3_.creator;
                  }
                  else
                  {
                     this.var_218.nowPlayingTrackName = "";
                     this.var_218.nowPlayingAuthorName = "";
                  }
               }
               break;
            case NowPlayingEvent.const_517:
               this.var_481.setPreviewIconToPause();
               _loc2_ = this.var_69.getSongInfo(param1.id);
               if(_loc2_ != null)
               {
                  this.var_197.songName = _loc2_.name;
                  this.var_197.authorName = _loc2_.creator;
               }
               else
               {
                  this.var_197.songName = "";
                  this.var_197.authorName = "";
               }
               this.selectMusicStatusViewByMusicState();
               break;
            case NowPlayingEvent.const_606:
               this.var_481.setPreviewIconToPlay();
               this.selectMusicStatusViewByMusicState();
         }
      }
      
      private function onClose(param1:WindowMouseEvent) : void
      {
         this.hide();
      }
      
      private function isPreviewPlaying() : Boolean
      {
         return this.var_69.getSongIdPlayingAtPriority(HabboMusicPrioritiesEnum.const_416) != -1;
      }
   }
}
