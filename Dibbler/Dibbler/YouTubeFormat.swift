//
//  YouTubeFormat.swift
//  Dibbler
//
//  Created by apple on 2019/5/27.
//  Copyright © 2019 OBFirm. All rights reserved.
//

import Foundation

class YouTubeFormat {
    
    enum StreamCodes: String
    {
        // MARK: - itag Code    Container    Content    Resolution    Bitrate    Range    VR / 3D
        case itag_5 = "5" //5    flv    audio/video    240p
        case itag_6 = "6" //6    flv    audio/video    270p
        case itag_17 = "17" //17    3gp    audio/video    144p
        case itag_18 = "18" //18    mp4    audio/video    360p
        case itag_22 = "22" //22    mp4    audio/video    720p
        case itag_34 = "34" //34    flv    audio/video    360p
        case itag_35 = "35" //35    flv    audio/video    480p
        case itag_36 = "36" //36    3gp    audio/video    180p
        case itag_37 = "37" //37    mp4    audio/video    1080p
        case itag_38 = "38" //38    mp4    audio/video    3072p
        case itag_43 = "43" //43    webm    audio/video    360p
        case itag_44 = "44" //44    webm    audio/video    480p
        case itag_45 = "45" //45    webm    audio/video    720p
        case itag_46 = "46" //46    webm    audio/video    1080p
        // MARK: - 3D
        // TODO: - 3D
        // FIXME: - 3D
        case itag_82 = "82" //82    mp4    audio/video    360p    -    -    3D
        case itag_83 = "83" //83    mp4    audio/video    480p    -    -    3D
        case itag_84 = "84" //84    mp4    audio/video    720p    -    -    3D
        case itag_85 = "85" //85    mp4    audio/video    1080p    -    -    3D
        case itag_92 = "92" //92    hls    audio/video    240p    -    -    3D
        case itag_93 = "93" //93    hls    audio/video    360p    -    -    3D
        case itag_94 = "94" //94    hls    audio/video    480p    -    -    3D
        case itag_95 = "95" //95    hls    audio/video    720p    -    -    3D
        
        case itag_96 = "96" //96    hls    audio/video    1080p
        // MARK: - 3D
        case itag_100 = "100" //100    webm    audio/video    360p    -    -    3D
        case itag_101 = "101" //101    webm    audio/video    480p    -    -    3D
        case itag_102 = "102" //102    webm    audio/video    720p    -    -    3D
        case itag_132 = "132" //132    hls    audio/video    240p
        case itag_133 = "133" //133    mp4    video    240p
        case itag_134 = "134" //134    mp4    video    360p
        case itag_135 = "135" //135    mp4    video    480p
        case itag_136 = "136" //136    mp4    video    720p
        case itag_137 = "137" //137    mp4    video    1080p
        case itag_138 = "138" //138    mp4    video    2160p60
        case itag_139 = "139" //139    m4a    audio    -    48k
        case itag_140 = "140" //140    m4a    audio    -    128k
        case itag_141 = "141" //141    m4a    audio    -    256k
        case itag_151 = "151" //151    hls    audio/video    72p
        case itag_160 = "160" //160    mp4    video    144p
        case itag_167 = "167" //167    webm    video    360p
        case itag_168 = "168" //168    webm    video    480p
        case itag_169 = "169" //169    webm    video    1080p
        case itag_171 = "171" //171    webm    audio    -    128k
        case itag_218 = "218" //218    webm    video    480p
        case itag_219 = "219" //219    webm    video    144p
        case itag_242 = "242" //242    webm    video    240p
        case itag_243 = "243" //243    webm    video    360p
        case itag_244 = "244" //244    webm    video    480p
        case itag_245 = "245" //245    webm    video    480p
        case itag_246 = "246" //246    webm    video    480p
        case itag_247 = "247" //247    webm    video    720p
        case itag_248 = "248" //248    webm    video    1080p
        case itag_249 = "249" //249    webm    audio    -    50k
        case itag_250 = "250" //250    webm    audio    -    70k
        case itag_251 = "251" //251    webm    audio    -    160k
        case itag_264 = "264" //264    mp4    video    1440p
        case itag_266 = "266" //266    mp4    video    2160p60
        case itag_271 = "271" //271    webm    video    1440p
        case itag_272 = "272" //272    webm    video    4320p
        case itag_278 = "278" //278    webm    video    144p
        case itag_298 = "298" //298    mp4    video    720p60
        case itag_299 = "299" //299    mp4    video    1080p60
        case itag_302 = "302" //302    webm    video    720p60
        case itag_303 = "303" //303    webm    video    1080p60
        case itag_308 = "308" //308    webm    video    1440p60
        case itag_313 = "313" //313    webm    video    2160p
        case itag_315 = "315" //315    webm    video    2160p60
        case itag_330 = "330" //330    webm    video    144p60    -    hdr
        case itag_331 = "331" //331    webm    video    240p60    -    hdr
        case itag_332 = "332" //332    webm    video    360p60    -    hdr
        case itag_333 = "333" //333    webm    video    480p60    -    hdr
        case itag_334 = "334" //334    webm    video    720p60    -    hdr
        case itag_335 = "335" //335    webm    video    1080p60    -    hdr
        case itag_336 = "336" //336    webm    video    1440p60    -    hdr
        case itag_337 = "337" //337    webm    video    2160p60    -    hdr
    }
}
