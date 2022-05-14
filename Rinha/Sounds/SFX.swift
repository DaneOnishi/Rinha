//
//  SFX.swift
//  Rinha
//
//  Created by Daniella Onishi on 09/05/22.
//

import Foundation
import AVFoundation

class SFXMusicSingleton: NSObject, AVAudioPlayerDelegate {
    static let shared = SFXMusicSingleton()
    fileprivate var currentPlayer: AVAudioPlayer?
    private override init() {}
    
    var players: [URL: AVAudioPlayer] = [:]
    var duplicatePlayers: [AVAudioPlayer] = []
    
    func playSound(soundFileName: String, loop: Bool) {
        
        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
        else{ return }
        
        let soundFileNameURL = URL(fileURLWithPath: bundle)
        if let player = players[soundFileNameURL] {
            
            if !player.isPlaying {
                player.prepareToPlay()
                player.play()
            } else {
                
                do {
                    let duplicatePlayer = try AVAudioPlayer(contentsOf: soundFileNameURL)
                    
                    duplicatePlayer.delegate = self
                    
                    duplicatePlayers.append(duplicatePlayer)
                    duplicatePlayer.prepareToPlay()
                    duplicatePlayer.play()
                    duplicatePlayer.numberOfLoops = loop ? -1 : 0
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        } else {
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameURL)
                players[soundFileNameURL] = player
                player.prepareToPlay()
                player.play()
                player.numberOfLoops = loop ? -1 : 0
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func playMusic(soundFileName: String, loop: Bool) {
        
        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
        else{ return }
        
        let soundFileNameURL = URL(fileURLWithPath: bundle)
        if let player = players[soundFileNameURL] {
            player.play()
        } else {
            do {
                let player = try AVAudioPlayer(contentsOf: soundFileNameURL)
                players[soundFileNameURL] = player
                player.prepareToPlay()
                player.play()
                player.numberOfLoops = loop ? -1 : 0
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func playMenuMusic() {
        playMusic(soundFileName: "Main-Menu-Soundtrack", loop: true)
    }
    
    func playRatSound() {
        playSound(soundFileName: "Rat-Sound", loop: false)
    }
    
    func playLlamaSound() {
        playSound(soundFileName: "Llama-Sound", loop: false)
    }
    
    func playCatSound() {
        playSound(soundFileName: "Cat-Sound", loop: false)
    }
    
    func playFishSound() {
        playSound(soundFileName: "Fish-Sound", loop: false)
    }
    
    func playMeerkatSound() {
        playSound(soundFileName: "Meerkat-Sound", loop: false)
    }
    
    func pauseMusic(soundFileName: String) {
        guard let bundle = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
        else{ return }
        let soundFileNameURL = URL(fileURLWithPath: bundle)
        players[soundFileNameURL]?.stop()
    }
    
    func pauseMenuMusic() {
        pauseMusic(soundFileName: "Main-Menu-Soundtrack")
    }
}
