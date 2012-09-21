/****************************************************************************
**
** Copyright (C) 2012 Nokia Corporation and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/
**
** This file is part of the Qt Graphical Effects module.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
**     the names of its contributors may be used to endorse or promote
**     products derived from this software without specific prior written
**     permission.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import "../../../src/effects"

TestCaseTemplate {

    ImageSource {
        id: imageSource
        forcedUpdateAnimationRunning: false
    }

    RecursiveBlur {
        id: effect
        loops: iterationSlider.value
        anchors.fill: imageSource
        radius: radiusSlider.value
        transparentBorder: transparentBorderCheckBox.selected
        visible: enabledCheckBox.selected
        cached: cachedCheckBox.selected
        source: imageSource
    }

    bgColor: bgColorPicker.color
    controls: [
        Control {
            caption: "general"
            Slider {
                id: iterationSlider
                minimum: 0
                maximum: 20
                value: 0
                integer:  true
                caption: "loops"
            }
            Slider {
                id: radiusSlider
                minimum: 0.0
                maximum: 16.0
                value: 7.5
                caption: "radius"
            }
            CheckBox {
                id: transparentBorderCheckBox
                caption: "transparentBorder"
                selected: false
            }
            ProgressBar {
                id: progressSlider
                minimum: 0
                maximum: 1.0
                value: effect.progress
                caption: "progress"
            }
        },

        Control {
            caption: "advanced"
            last: true
            Label {
                caption: "Effect size"
                text: effect.width + "x" + effect.height
            }
            Label {
                caption: "FPS"
                text: fps
            }
            CheckBox {
                id: cachedCheckBox
                caption: "cached"
            }
            CheckBox {
                id: enabledCheckBox
                caption: "enabled"
            }
            BGColorPicker {
                id: bgColorPicker
            }
        }
    ]
}