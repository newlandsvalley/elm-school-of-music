module Music.Producers exposing (..)

import Array exposing (..)
import Maybe exposing (withDefault)
import Check.Producer exposing (..)
import Music exposing (..)

pitchClasses : Array PitchClass
pitchClasses =
   [  Cff, Cf  , C , Dff , Cs , Df , Css , D , Eff , Ds
   ,  Ef , Fff , Dss , E , Ff , Es , F , Gff , Ess , Fs
   ,  Gf , Fss , G , Aff , Gs , Af , Gss , A , Bff , As
   ,  Bf , Ass , B , Bs , Bss ]
     |> Array.fromList

pitchClass : Producer PitchClass
pitchClass =
   let
     f i = Array.get i pitchClasses
             |> withDefault C
   in
     rangeInt 0 34
       |> Check.Producer.map f

octave : Producer Octave
octave =
   rangeInt 0 8

pitches : Producer Pitch
pitches = Check.Producer.tuple (pitchClass, octave)



      