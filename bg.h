
//{{BLOCK(bg)

//======================================================================
//
//	bg, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 244 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 15616 + 8192 = 24320
//
//	Time-stamp: 2017-11-14, 14:40:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 15616
extern const unsigned short bgTiles[7808];

#define bgMapLen 8192
extern const unsigned short bgMap[4096];

#define bgPalLen 512
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
