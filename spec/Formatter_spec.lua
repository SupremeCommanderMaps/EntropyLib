describe("Formatter", function()

    local Formatter = require "src/Formatter"

	describe("formatTime", function()
		it("handles 0 seconds", function()
			assert.are.equal(
				"0 seconds",
				Formatter.formatTime(0)
			)
		end)

		it("handles multiple seconds", function()
			assert.are.equal(
				"42 seconds",
				Formatter.formatTime(42)
			)
		end)

		it("handles multiple minutes", function()
			assert.are.equal(
				"2 minutes",
				Formatter.formatTime(120)
			)
		end)

		it("handles one minute", function()
			assert.are.equal(
				"1 minute",
				Formatter.formatTime(60)
			)
		end)

		it("handles one second", function()
			assert.are.equal(
				"1 second",
				Formatter.formatTime(1)
			)
		end)

		it("handles minutes plus seconds", function()
			assert.are.equal(
				"2 minutes and 10 seconds",
				Formatter.formatTime(130)
			)
		end)

		it("outputs sub two minutes as seconds", function()
			assert.are.equal(
				"70 seconds",
				Formatter.formatTime(70)
			)
		end)

		it("handles single seconds in long times", function()
			assert.are.equal(
				"10 minutes and 1 second",
				Formatter.formatTime(601)
			)
		end)
	end)


end)
