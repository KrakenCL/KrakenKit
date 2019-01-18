import XCTest
import TensorFlow

@testable import KrakenKit


final class KrakenKitTests: XCTestCase {
    func testUpperBound() {

        //                0     1    2   3  4  5    6  7  8  9 10  11 12  13
        let a: [Float] = [-1, -0.5, 0.9, 1, 2, 3,   4, 5, 6, 7, 8, 9, 10]
        let b: [Float] = [-1, -0.5, 0.9, 1, 2, 3,   4, 5, 6, 7, 8, 9, 10, 11]
        let c: [Float] = [-1, -0.5, 0.9, 1, 2, 3.3, 4, 5, 6, 7, 8, 9, 10, 11]
        let d: [Float] = [-1, -0.5, 0.9, 1, 2, 3.3, 4, 5, 6, 7, 8, 9, 10]
        
        XCTAssertEqual(a.upperBound(value: 1.0), 4)
        XCTAssertEqual(a.upperBound(value: 0.99), 3)
        XCTAssertEqual(b.upperBound(value: 1.0), 4)
        XCTAssertEqual(b.upperBound(value: 0.99), 3)
        
        XCTAssertEqual(a.upperBound(value: -10), 0)
        XCTAssertEqual(a.upperBound(value: 100), 12)
        XCTAssertEqual(b.upperBound(value: 100), 13)

        XCTAssertEqual(b.upperBound(value: -10), 0)
        
        XCTAssertEqual(c.upperBound(value: 3.3), 6)
        XCTAssertEqual(c.upperBound(value: 3.4), 6)
        XCTAssertEqual(d.upperBound(value: 3.3), 6)
        XCTAssertEqual(d.upperBound(value: 3.4), 6)
    }

    func checkFileWriterStatus(fileWriter: FileWriter) {
        
        guard let fileURL = fileWriter.fileURL else {
            XCTAssert(false)
            return
        }
        
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            XCTAssert(false)
            return
        }
    }
    
    func testHistogramSummary() {
        let summary = Summary()

        guard let fileWriterURL = URL(string: "/tmp/KrakenKit/tests/") else {
            XCTAssert(false)
            return
        }
        
        let fileWriter = try! FileWriter(folder: fileWriterURL, identifier: "summary-histogram")
        
        for step in 0..<100 {
            let floatTensor = Tensor<Float>(randomNormal: TensorShape([1000]))
            let doubleTensor = Tensor<Double>(randomNormal: TensorShape([1000]))
            let integerTensor = Tensor<Double>(randomNormal: TensorShape([1000]))

            summary.histogram(tensor: floatTensor, tag: "tests/Float/Tensor")
            summary.histogram(tensor: doubleTensor, tag: "tests/Double/Tensor")
            summary.histogram(tensor: integerTensor, tag: "tests/Integer/Tensor")

            // After that operation summary is clear
            if step % 2 == 0 {
                XCTAssertEqual(summary.proto.value.count, 3)
            } else {
                try! fileWriter.add(summary: summary, step: step)
            }
        }
        checkFileWriterStatus(fileWriter:fileWriter)
    }
    
    
    func testScalarSummary() {
        
        let summary = Summary()
        
        guard let fileWriterURL = URL(string: "/tmp/KrakenKit/tests/") else {
            XCTAssert(false)
            return
        }
        
        let fileWriter = try! FileWriter(folder: fileWriterURL, identifier: "summary-scalar")
        
        for step in 1..<100 {
            
            summary.add(scalar: Int(step) + Int(drand48() * 10), tag: "tests/Scalar/Int")
            summary.add(scalar: (Float(step)  / 50.0) + Float(drand48()), tag: "tests/Scalar/Float")
            summary.add(scalar: Double(step) / 50.0 + drand48(), tag: "tests/Scalar/Double")

            // After that operation summary is clear
            if step % 2 == 0 {
                XCTAssertEqual(summary.proto.value.count, 3)
            }
            try! fileWriter.add(summary: summary, step: step)
        }

        checkFileWriterStatus(fileWriter:fileWriter)
    }
    
    func testTensorSummary() {
        
        let summary = Summary()
        
        guard let fileWriterURL = URL(string: "/tmp/KrakenKit/tests/") else {
            XCTAssert(false)
            return
        }
        
        let fileWriter = try! FileWriter(folder: fileWriterURL, identifier: "summary-tensor")
        
        for step in 1..<3 {
            
            let floatTensor = Tensor<Float>(randomNormal: TensorShape([1000]))
            let doubleTensor = Tensor<Double>(randomNormal: TensorShape([1000]))
            let integerTensor = Tensor<Double>(randomNormal: TensorShape([1000]))
            
            summary.add(tensor: floatTensor, tag: "Tensor/Float")
            summary.add(tensor: doubleTensor, tag: "Tensor/Double")
            summary.add(tensor :integerTensor, tag: "Tensor/Integer")
            // After that operation summary is clear
            if step % 2 == 0 {
                XCTAssertEqual(summary.proto.value.count, 3)
            }
            try! fileWriter.add(summary: summary, step: step)
        }
        
        checkFileWriterStatus(fileWriter:fileWriter)
    }

    func testImageSummary() {
        
        let summary = Summary()
        
        guard let fileWriterURL = URL(string: "/tmp/KrakenKit/tests/") else {
            XCTAssert(false)
            return
        }
        
        let fileWriter = try! FileWriter(folder: fileWriterURL, identifier: "summary-image")
        
        let size = Summary.ImageSize(width: 25, height: 25)
        summary.image(array: [], colorspace: .rgba, size: size, tag: "/image/0")
        try! fileWriter.add(summary: summary, step: 0)

       
        
        checkFileWriterStatus(fileWriter:fileWriter)
    }
    
    static var allTests = [
        ("testScalarSummary", testScalarSummary),
        ("testScalarSummary", testScalarSummary),
        ("testUpperBound", testUpperBound),
    ]
}
