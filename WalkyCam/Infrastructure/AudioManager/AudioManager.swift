//
//  AudioManager.swift
//  WalkyCam
//
//  Created by Gabriel Gazal on 23/12/24.
//

import Foundation
import AVFoundation
import Accelerate
import SwiftUI

class AudioManager: ObservableObject {
    public static let shared = AudioManager()
    
    private var audioEngine: AVAudioEngine
    private var inputNode: AVAudioInputNode
    private var audioBufferSize: UInt32
    private var colorChangeThreshold: Float = 0.05
    @State private var lastRMS: Float = 0.0
    
    init() {
        self.audioEngine = AVAudioEngine()
        self.inputNode = audioEngine.inputNode
        self.audioBufferSize = 1024
    }
    
    func startListening(onChangeColor: ((CGFloat) -> Void)?) {
        let format = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: audioBufferSize, format: format) { [weak self] buffer, _ in
            guard let self = self else { return }
            self.processAudio(buffer: buffer, onChangeColor: onChangeColor)
        }
        
        do {
            try audioEngine.start()
        } catch {
            print("Erro ao iniciar o áudio: \(error)")
        }
    }
    
    func stopListening() {
        inputNode.removeTap(onBus: 0)
        audioEngine.stop()
    }
    
    private func processAudio(buffer: AVAudioPCMBuffer, onChangeColor: ((CGFloat) -> Void)?) {
        let channelData = buffer.floatChannelData![0]
        let frameLength = Int(buffer.frameLength)
        
        let rms = calculateRMS(channelData: channelData, frameLength: frameLength)
        if abs((rms - lastRMS) / lastRMS) >= 0.5 {
            lastRMS = rms
            print("RMS\(rms)")
            DispatchQueue.main.async {
                onChangeColor?(CGFloat(rms))
            }
        }
    }
    
    private func calculateRMS(channelData: UnsafePointer<Float>, frameLength: Int) -> Float {
        var sum: Float = 0.0
        vDSP_svesq(channelData, 1, &sum, vDSP_Length(frameLength))
        return sqrt(sum / Float(frameLength)) * 100
    }
}
