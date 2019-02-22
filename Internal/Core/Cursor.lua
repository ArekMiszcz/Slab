--[[

MIT License

Copyright (c) 2019 Mitchell Davis <coding.jackalope@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

--]]

local Cursor = {}

local State = 
{
	X = 0.0,
	Y = 0.0,
	PrevX = 0.0,
	PrevY = 0.0,
	AnchorX = 0.0,
	AnchorY = 0.0,
	ItemX = 0.0,
	ItemY = 0.0,
	ItemW = 0.0,
	ItemH = 0.0,
	PadX = 4.0,
	PadY = 4.0,
	NewLineSize = 16.0
}

function Cursor.SetPosition(X, Y)
	State.PrevX = State.X
	State.PrevY = State.Y
	State.X = X
	State.Y = Y
end

function Cursor.SetX(X)
	State.PrevX = State.X
	State.X = X
end

function Cursor.SetY(Y)
	State.PrevY = State.Y
	State.Y = Y
end

function Cursor.AdvanceX(X)
	State.PrevX = State.X
	State.X = State.X + X + State.PadX
end

function Cursor.AdvanceY(Y)
	State.X = State.AnchorX
	State.PrevY = State.Y
	State.Y = State.Y + Y + State.PadY
end

function Cursor.SetAnchor(X, Y)
	State.AnchorX = X
	State.AnchorY = Y
end

function Cursor.GetAnchor()
	return State.AnchorX, State.AnchorY
end

function Cursor.GetAnchorX()
	return State.AnchorX
end

function Cursor.GetAnchorY()
	return State.AnchorY
end

function Cursor.GetPosition()
	return State.X, State.Y
end

function Cursor.GetX()
	return State.X
end

function Cursor.GetY()
	return State.Y
end

function Cursor.SetItemBounds(X, Y, W, H)
	State.ItemX = X
	State.ItemY = Y
	State.ItemW = W
	State.ItemH = H
end

function Cursor.GetItemBounds()
	return State.ItemX, State.ItemY, State.ItemW, State.ItemH
end

function Cursor.SameLine(Pad)
	Pad = Pad ~= nil and Pad or 0.0
	State.X = State.ItemX + State.ItemW + State.PadX + Pad
	State.Y = State.PrevY
end

function Cursor.SetNewLineSize(NewLineSize)
	State.NewLineSize = NewLineSize
end

function Cursor.NewLine()
	Cursor.AdvanceY(State.NewLineSize)
end

return Cursor
