package app

/**
 * The computer model.
 */
class Computer {

    String ipAddress
    String name

    OperatingSystem operatingSystem
    FileSystem fileSystem

    Collection components

    static hasMany = [components: Component]

    static constraints = {
        ipAddress(unique: true)
        name(unique: true)
    }

    /**
     * Returns all the Software components.
     */
    def getSoftware() {
        components.split {
            Software.class.isAssignableFrom(it.getClass())
        }[0]
    }

    /**
     * Returns all the Hardware components.
     */
    def getHardware() {
        components.split {
            Hardware.class.isAssignableFrom(it.getClass())
        }[0]
    }

    /**
     * Returns all the Ram memory capacity in Gigabytes.
     */
    def getMemoryCapacity() {
        int totalCapacity = 0
        Collection rams = components.split {
            Ram.class.isAssignableFrom(it.getClass())
        }[0]

        if (rams) {
            rams.split { totalCapacity += it.capacity }
        }
        totalCapacity
    }

    /**
     * Returns the used storage.
     */
     def getUsedStorage() {
        Collection allSoftware = getSoftware()
        float usedStorage = 0

        if (allSoftware) {
            allSoftware.each {
                if (it.requirements) {
                    usedStorage += it.requirements.storage
                }
            }
        }
        usedStorage
     }

    /**
     * Returns the total storage capacity in Gigabytes.
     */
    def getTotalStorage() {
        int totalStorage = 0
        Collection hardDrives = components.split {
            HardDrive.class.isAssignableFrom(it.getClass())
        }[0]

        if (hardDrives) {
            hardDrives.split { totalStorage += it.storage }
        }
        totalStorage
    }

    /**
     * Returns all the available storage in the Computer.
     */
    def getAvailableStorage() {
        return getTotalStorage() - getUsedStorage()
    }

}
