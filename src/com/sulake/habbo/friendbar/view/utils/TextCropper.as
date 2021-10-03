package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.ITextWindow;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class TextCropper implements IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_508:TextField;
      
      private var var_939:TextFormat;
      
      private var var_2905:String = "...";
      
      private var var_2906:int = 20;
      
      public function TextCropper()
      {
         super();
         this.var_508 = new TextField();
         this.var_508.autoSize = TextFieldAutoSize.LEFT;
         this.var_939 = this.var_508.defaultTextFormat;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_508 = null;
            this._disposed = true;
         }
      }
      
      public function crop(param1:ITextWindow) : void
      {
         var _loc3_:int = 0;
         this.var_939.font = param1.fontFace;
         this.var_939.size = param1.fontSize;
         this.var_939.bold = param1.bold;
         this.var_939.italic = param1.italic;
         this.var_508.setTextFormat(this.var_939);
         this.var_508.text = param1.getLineText(0);
         var _loc2_:int = this.var_508.textWidth;
         if(_loc2_ > param1.width)
         {
            _loc3_ = this.var_508.getCharIndexAtPoint(param1.width - this.var_2906,this.var_508.textHeight / 2);
            param1.text = param1.text.slice(0,_loc3_) + this.var_2905;
         }
      }
   }
}
